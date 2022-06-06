package ansv.vn.controller.admin;

import ansv.vn.dto.History;
import ansv.vn.entity.*;
import ansv.vn.service.admin.*;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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

    public List<Department> processDepartment(List<Department> listdep){
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

    public boolean checkRoleUser(String role){
        return arrRole.contains(role.trim());
    }

    public List<Course> checkCourse(List<Course> listCou){
        List<Course> list = new ArrayList<>();
        for (Course c : listCou){
            List<Video> listv = videoService.getAllVideoByIdCourse(c.getId());
            List<Document> listdoc = documentService.getAllDocByIdCou(c.getId());

            if(listv.size() != 0 || listdoc.size() != 0 ){
                int countU = courseService.getNumberUserByCourse(c.getId());
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
    public String goAddCourse(Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("typeC", new CourseType());
        model.addAttribute("course", new Course());
        model.addAttribute("department",departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course",courseService.getAllDataCourseType());

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
    public String addCourse(@ModelAttribute("course") Course course){
        //set image default
        course.setUrl_img("/ANSV/assets/course/img/ANSV.png");

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
    public String editCourse(@ModelAttribute("course") Course course){
        courseService.updateCourseByIdCourse(course);
        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/delete/{id}")
    public String deleteCourse(@PathVariable int id){

        courseService.deleteHistoryByIdCourse(id);
        documentService.deleteADocByIdCou(id);
        videoService.deleteVideoByIdCourse(id);
        courseService.deleteCourseByIdCourse(id);

        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/search",method = RequestMethod.GET)
    @ResponseBody
    public String goSearchCourseAdmin(@RequestParam("query") String query) {
        int numb = courseService.searchCourseForSepRole(query).size();
        return String.valueOf(numb);
    }

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
            listdep = departmentService.getDepartmentForSepRole();
        }else{
            listdep = departmentService.getDepartmentForUser();
        }

        List<Department> listd = processDepartment(listdep);
        model.addAttribute("department", listd);
        model.addAttribute("show",1);
        return "course/course_home";
    }



    @RequestMapping("/user/khoa-hoc/tat-ca")
    public String goAllCourse(Model model) {

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);
        processNotification(model,noDtoId,idUser);

        List<Department> listdep;
        if(checkRoleSep){
            listdep = departmentService.getAllDepartmentForAdmin();
        }else{
            listdep = departmentService.getAllDepartmentForUser();
        }

        List<Department> listd = processDepartment(listdep);

        model.addAttribute("show",0);
        model.addAttribute("department", listd);
        return "course/course_all";
    }

    @RequestMapping("/user/khoa-hoc/tat-ca/{id}")
    public String goAllCourse(@PathVariable int id , Model model) {

        //get in table user-notification
        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(idUser);

        processNotification(model, noDtoId, idUser);

        List<Course> listc = new ArrayList<>();
        for (Course c : courseService.getAllDataCourseOfDepId(id)) {
            if (documentService.getAllDocByIdCou(c.getId()).size() != 0
                    || videoService.getAllVideoByIdCourse(c.getId()).size() != 0) {
                listc.add(c);
            }
        }

        model.addAttribute("show",0);
        model.addAttribute("course", listc);
        model.addAttribute("department",  departmentService.getDepartmentById(id).getName());
        return "course/course_a_department";
    }

    @RequestMapping("/user/khoa-hoc/{id}")
    public String goDetailCoursePage(@PathVariable int id ,Model model) {

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
            System.out.println(videof.getUrl());
        }

        Course course = courseService.getCourseById(id);

        model.addAttribute("show",0);
        model.addAttribute("course",course);
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
        model.addAttribute("course",listc);
        model.addAttribute("text",query);
        model.addAttribute("show",0);
        return "course/course_search";
    }

}
