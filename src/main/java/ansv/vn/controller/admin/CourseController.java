package ansv.vn.controller.admin;

import ansv.vn.dto.Comments;
import ansv.vn.dto.History;
import ansv.vn.entity.*;
import ansv.vn.service.admin.*;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CourseController {

    private final CourseService courseService;

    private final DepartmentService departmentService;

    private final VideoService videoService;

    private final UserService userService;

    private final NotificationService notificationService;

    private final DocumentService documentService;

    private final ArrayList<String> arrRole = new ArrayList<>();
    private ArrayList<Course> search = new ArrayList<>();

    private final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm:ss");
    private final ZonedDateTime now = ZonedDateTime.now();
    private final ZonedDateTime dateTime = now.withZoneSameInstant(ZoneId.of("Asia/Ho_Chi_Minh"));


    private Authentication authentication;
    private UserDetails userDetails;
    private String username;
    private int idUser;
    private List<Integer> notifi;

    private boolean checkRoleSep;

    public CourseController(CourseService courseService, DepartmentService departmentService, VideoService videoService,
                            UserService userService, NotificationService notificationService, DocumentService documentService) {
        this.courseService = courseService;
        this.departmentService = departmentService;
        this.videoService = videoService;
        this.userService = userService;
        this.notificationService = notificationService;
        this.documentService = documentService;

        arrRole.add("[ROLE_DF]");
        arrRole.add("[ROLE_CEO]");
        arrRole.add("[ROLE_ADMIN_COURSE]");
    }

    private List<Department> processDepartment(List<Department> listdep){
        List<Department> listd = new ArrayList<>();

        for (Department departments : listdep) {
            List<Course> listCou = courseService.getDataCouseraByIdDep(departments.getId());
            List<Course> listc = checkCourse(listCou);

            if(listc.size() != 0){
                departments.setCourseList(listc);
                listd.add(departments);
            }

        }
        return listd;
    }

    private boolean checkRoleUser(String role){
        return arrRole.contains(role.trim());
    }

    private List<Course> checkCourse(List<Course> listCou){
        List<Course> list = new ArrayList<>();
        for (Course c : listCou){
            List<Video> listv = videoService.getAllVideoByIdCourse(c.getId());
            List<Document> listdoc = documentService.getAllDocByIdCou(c.getId());

            if(listv.size() != 0 || listdoc.size() != 0 ){
                int countU = courseService.getNumberUserByCourse(c.getId());
                float startVote;
                try{
                    startVote = courseService.getAverageVoteOfCourse(c.getId());
                }catch (Exception ex){
                     startVote = 0;
                }

                c.setStartVote(startVote);
                c.setCountUser(countU);
                list.add(c);
            }
        }
        return list;
    }

    private void processNotification(Model model, List<Integer> noDtoId, int idUser) {
        if(noDtoId.size() != 0){
            List<Notification> isRead = new ArrayList<>();
            List<Notification> unRead = new ArrayList<>();

            for( Integer integer : notifi){
                boolean check = noDtoId.contains(integer);
                if(check){
                    isRead.add(notificationService.getDataNotificationById(integer));
                }else{
                    unRead.add(notificationService.getDataNotificationById(integer));
                }
            }
            model.addAttribute("notificationUnR", unRead);
            model.addAttribute("notification", isRead);
        }else{
            List<Notification> notifications = notificationService.getAllDataNotificationCourse();
            model.addAttribute("notificationUnR", notifications);
        }

        if(courseService.getAllHistory(idUser).size() != 0) {
            List<Course> listc = new ArrayList<>();
            for (History h : courseService.getAllHistory(idUser)) {
                listc.add(courseService.getCourseById(h.getIdc()));
            }
            model.addAttribute("history",listc);
        }
    }

    //Admin
    @RequestMapping("/admin/khoa-hoc/quan-ly/course")
    public String goProcessCourse(Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("type_course",courseService.getAllDataCourseType());
        model.addAttribute("course", courseService.getAllCourse());

        return "admin/course/view_cource";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/save")
    public String goAddCourse(@RequestParam(required = false) String message, Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("typeC", new CourseType());
        model.addAttribute("course", new Course());
        model.addAttribute("department",departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course",courseService.getAllDataCourseType());
        if (message != null && !message.isEmpty()) {

            if (message.equals("reject")) {
                model.addAttribute("message", "Mục này không thể xóa!!\nDO CÓ LIÊN QUAN ĐẾN NHIỀU KHÓA HỌC KHÁC");
            }
        }
        return "admin/course/add_course";
    }

    @RequestMapping({"/admin/khoa-hoc/quan-ly/course/detail/{id}"})
    public String goDetailCourse(@PathVariable int id, Model model) {
        model.addAttribute("redirect", 1);

        model.addAttribute("course", courseService.getCourseById(id));
        model.addAttribute("department", departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course", courseService.getAllDataCourseType());
        model.addAttribute("videos", videoService.getAllVideoByIdCourse(id));
        model.addAttribute("docs", documentService.getAllDocByIdCou(id));


        model.addAttribute("video", new Video());
        model.addAttribute("doc", new Document());

        return "admin/course/detail_course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/saveCourse")
    public String addCourse(@RequestParam("fileup") CommonsMultipartFile file,
                            @ModelAttribute("course") Course course,
                            HttpSession s){

        byte[] data = file.getBytes();
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "course" + File.separator
                + "img" + File.separator + "course" + File.separator + file.getOriginalFilename();
        try {
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(data);
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        courseService.insertCourse(course);
        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/update/{id}")
    public String editCourse(@PathVariable int id, Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("course",courseService.getCourseById(id));
        model.addAttribute("department",departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course",courseService.getAllDataCourseType());

        return "admin/course/update_course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/updateCourse")
    public String editCourse(@RequestParam("fileup") CommonsMultipartFile file,
                             @ModelAttribute("course") Course course, HttpSession s){
        byte[] data = file.getBytes();
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "course" + File.separator
                + "img" + File.separator + "course" + File.separator + file.getOriginalFilename();
        try {
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(data);
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        courseService.updateCourseByIdCourse(course);
        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/delete/{id}")
    public String deleteCourse(@PathVariable int id, HttpSession s){

        Course course = courseService.getCourseById(id);
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "course" + File.separator
                + "img" + File.separator + "course" + File.separator + course.getUrl_img();

        File file = new File(path);
        if(file.exists()){
            file.delete();
        }

        courseService.deleteHistoryByIdCourse(id);
        documentService.deleteADocByIdCou(id);
        videoService.deleteVideoByIdCourse(id);
        courseService.deleteCourseByIdCourse(id);

        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

//    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/search",method = RequestMethod.GET)
//    @ResponseBody
//    public String goSearchCourseAdmin(@RequestParam("query") String query) {
//        int numb = courseService.searchCourseForSepRole(query).size();
//        return String.valueOf(numb);
//    }

    //User
    @RequestMapping("/user/khoa-hoc/trang-chu")
    public String goCoursePage(Model model, Authentication authentication, HttpSession session){

        if (authentication != null) {
            this.authentication = authentication;
            this.userDetails = (UserDetails) authentication.getPrincipal();

            username = userDetails.getUsername();
            idUser = userService.getByUser(username).getId();
            session.setAttribute("display_name", userService.getByUser(username).getDisplay_name());
            session.setAttribute("username", username);


            //get in table user-notification

            List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);
            notifi = notificationService.getAllIdNotificationCourse();

            processNotification(model, noDtoId, idUser);

            checkRoleSep = checkRoleUser(userDetails.getAuthorities().toString());
        }

        List<Department> listdep;
        if(checkRoleSep){
            listdep = departmentService.getAllDepartmentForAdmin();
        }else{
            listdep = departmentService.getDepartmentForUser();
        }

        int numberUser = courseService.getNumberUserBySystem();
        List<Department> listd = processDepartment(listdep);
        model.addAttribute("department", listd);
        model.addAttribute("numberUser", numberUser);

        return "course/course_home";
    }

    @RequestMapping(value = "/user/khoa-hoc/{department}",method = RequestMethod.GET)
    public String goAllCourse(@PathVariable String department, Model model) {

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);
        processNotification(model,noDtoId,idUser);

        Department depart = departmentService.getDepartmentByName(department);

        List<Course> listc = new ArrayList<>();
        for (Course c : courseService.getAllDataCourseOfDepId(depart.getId())) {
            if (documentService.getAllDocByIdCou(c.getId()).size() != 0
                    || videoService.getAllVideoByIdCourse(c.getId()).size() != 0) {
                listc.add(c);
            }
        }

        model.addAttribute("course", listc);
        model.addAttribute("departments",  depart.getName());
        return "course/course_a_department";
    }

    @RequestMapping("/user/khoa-hoc/{departments}/{id}")
    public String goDetailCoursePage(@PathVariable String departments, @PathVariable int id ,Model model) {

        boolean flag = courseService.checkHistoryIsExsit(id,idUser);
        if(!flag){
            courseService.addNewHistory(id,idUser);
        }

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);
        processNotification(model,noDtoId,idUser);

        if(documentService.getAllDocByIdCou(id).size() != 0){
            model.addAttribute("docs", documentService.getAllDocByIdCou(id));
        }

        if(videoService.getAllVideoByIdCourse(id).size() != 0){
            model.addAttribute("listVideo",videoService.getAllVideoByIdCourse(id));
            Video videof = videoService.getFirtsVideo(id);
            model.addAttribute("videof",videof);
        }

        if(videoService.getCommandOfAVideo(id).size() != 0){
            List<Comments> listVote  = new ArrayList<>();

            for(Comments v : videoService.getCommandOfAVideo(id)){
                v.setUsername(userService.getDisplayById(v.getId_u()));
                    listVote.add(v);
            }
            model.addAttribute("listCmt",listVote);
        }

        Course course = courseService.getCourseById(id);
        model.addAttribute("markss", videoService.getUserVote(id,idUser));
        model.addAttribute("numberVote", videoService.getNumberVote(id));
        model.addAttribute("course",course);
        model.addAttribute("departments",  departments);
        return "course/course_detail";
    }
    @RequestMapping("/user/khoa-hoc/{departments}/{id}/{url}")
    public String goDetailOtherCoursePage(@PathVariable String departments, @PathVariable int id, @PathVariable String url ,Model model) {

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);
        processNotification(model,noDtoId,idUser);

        if(documentService.getAllDocByIdCou(id).size() != 0){
            model.addAttribute("docs", documentService.getAllDocByIdCou(id));
        }

        if(videoService.getAllVideoByIdCourse(id).size() != 0){
            model.addAttribute("listVideo",videoService.getAllVideoByIdCourse(id));
        }

        if(videoService.getCommandOfAVideo(id).size() != 0){
            List<Comments> listVote  = new ArrayList<>();

            for(Comments v : videoService.getCommandOfAVideo(id)){
                v.setUsername(userService.getDisplayById(v.getId_u()));
                listVote.add(v);
            }
            model.addAttribute("listCmt",listVote);
        }
        int mark = videoService.getUserVote(id,idUser);

        Course course = courseService.getCourseById(id);
        model.addAttribute("url",url);
        model.addAttribute("markss",mark);
        model.addAttribute("numberVote", videoService.getNumberVote(id));
        model.addAttribute("course",course);
        model.addAttribute("departments",  departments);
        return "course/course_detail";
    }

    @RequestMapping(value = "/user/khoa-hoc/search",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String goSearchCourse(@RequestParam("query") String query){
        List<Course> listc;
        String result = "";

        if(checkRoleSep){
            listc = checkCourse(courseService.searchCourseForSepRole(query));
        }else{
            listc = checkCourse(courseService.searchCourseUser(query));
        }

        if(listc.size() != 0) {
            for (Course c : listc) {
                result += "<li onclick=\"select(this)\">" + c.getName() + "</li>";
            }
        }
        return result;
    }

    @RequestMapping(value = "/user/khoa-hoc/search/{query}",method = RequestMethod.GET)
    public String goSearchCousePage(@PathVariable String query , Model model) {

        //get in table user-notification
        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);

        processNotification(model,noDtoId,idUser);

        List<Course> listc;
        if(checkRoleSep){
            listc = checkCourse(courseService.searchCourseForSepRole(query));
        }else{
            listc = checkCourse(courseService.searchCourseUser(query));
        }
        for (Course c : listc){
            String depaetname = departmentService.getDepartmentById(c.getId_depenment()).getName();
            c.setDepartmentName(depaetname);
        }
        model.addAttribute("course",listc);
        model.addAttribute("text",query);
        return "course/course_search";
    }

    @RequestMapping(value = "/user/khoa-hoc/vote",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public @ResponseBody String addVote(HttpServletRequest request) {

        int mark = Integer.parseInt(request.getParameter("mark"));
        int id_c = Integer.parseInt(request.getParameter("id_c"));

        videoService.addNewVote(idUser,id_c,mark);
        return "1";
    }

    @RequestMapping(value = "/user/khoa-hoc/comment",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public @ResponseBody String addNewCommnet(HttpServletRequest request) {

        String cmt = request.getParameter("comments");
        int id = Integer.parseInt(request.getParameter("id_c"));

        Comments comments = new Comments();
        comments.setId_u(idUser);
        comments.setUsername(username);
        comments.setId_c(id);
        comments.setCmt(cmt);
        comments.setDayup(dtf.format(dateTime));

        videoService.addNewCommandAndVote(comments);
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
            ajaxResponse = mapper.writeValueAsString(comments);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return ajaxResponse;
    }


    @RequestMapping(value = "/user/khoa-hoc/changepass",method = RequestMethod.GET)
    public  String changePasswords(Model model) {
        return "course/edit_account";
    }

    @RequestMapping(value = "/user/khoa-hoc/changepassed",method = RequestMethod.POST)
    public String changePassed(@RequestParam("password") String pass, Model model) {
        String mahoa = BCrypt.hashpw(pass ,BCrypt.gensalt(10));
        userService.changePassOfUser(idUser, mahoa);
        return "redirect:/user/khoa-hoc/trang-chu";
    }


}
