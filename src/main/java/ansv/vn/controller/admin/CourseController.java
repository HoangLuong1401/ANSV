package ansv.vn.controller.admin;

import ansv.vn.dto.History;
import ansv.vn.entity.*;
import ansv.vn.service.admin.*;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private CourseService courseService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private VideoService videoService;

    @Autowired
    private UserService userService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private DocumentService documentService;

    private ArrayList<String> arrRole = new ArrayList<>();
    private boolean checkRoleSep;


    public CourseController() {
        arrRole.add("[ROLE_DF]");
        arrRole.add("[ROLE_ADMIN]");
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
        if(arrRole.contains(role.trim())){
            return true;
        } else{
            return false;
        }
    }

    public List<Course> checkCourse(List<Course> listCou){
        List<Course> listc = new ArrayList<>();
        for (Course c : listCou){
            List<Video> listv = videoService.getAllVideoByIdCourse(c.getId());
            List<Document> listdoc = documentService.getAllDocByIdCou(c.getId());

            if(listv.size() != 0 || listdoc.size() != 0 ){
                listc.add(c);
            }
        }
        return listc;
    }

    //Admin
    @RequestMapping("/admin/khoa-hoc/quan-ly/course")
    public String goProcessCousrse(Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("type_course",courseService.getAllDataCourseType());
        model.addAttribute("course", courseService.getAllCourse());

        return "admin/course/view_cource";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/save")
    public String goAddCousrse(Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("typeC", new CourseType());
        model.addAttribute("course", new Course());
        model.addAttribute("department",departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course",courseService.getAllDataCourseType());

        return "admin/course/add_course";
    }

    @RequestMapping({"/admin/khoa-hoc/quan-ly/course/detail/{id}"})
    public String goDetailCousrse(@PathVariable int id, Model model) {
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
    public String addCousrse(@ModelAttribute("course") Course course){
        //set image default
        course.setUrl_img("/ANSV/assets/course/img/ANSV.png");

        courseService.insertCourse(course);

        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/update/{id}")
    public String editCousrse(@PathVariable int id, Model model){
        model.addAttribute("redirect", 1);

        model.addAttribute("course",courseService.getCourseById(id));
        model.addAttribute("department",departmentService.getAllDepartmentForAdmin());
        model.addAttribute("type_course",courseService.getAllDataCourseType());

        return "admin/course/update_course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/updateCourse")
    public String editCousrse(@ModelAttribute("course") Course course){
        courseService.updateCourseByIdCourse(course);
        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/course/delete/{id}")
    public String deleteCousrse(@PathVariable int id){

        courseService.deleteHistoryByIdCourse(id);
        documentService.deleteADocByIdCou(id);
        videoService.deleteVideoByIdCourse(id);
        courseService.deleteCourseByIdCourse(id);

        return "redirect:/admin/khoa-hoc/quan-ly/course";
    }

    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/search",method = RequestMethod.GET)
    @ResponseBody
    public String goSearchCouseAdmin(@RequestParam("query") String query) {
        int numb = courseService.searchCourseForSepRole(query).size();
        return String.valueOf(numb);
    }

    //User
    @RequestMapping("/user/khoa-hoc/trang-chu")
    public String goCoursePage(Model model, Authentication authentication, HttpSession session){

        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            session.setAttribute("display_name", userService.getByUser(userName).getDisplay_name());
            session.setAttribute("username", userName);

            int id = userService.getByUser(userName).getId();
            //get in table user-notification

            List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(id);
            List<Integer> notifi = notificationService.getAllIdNotificationCourse();

            if(noDtoId.size() != 0){
                List<Notification> isRead = new ArrayList<>();
                List<Notification> unRead = new ArrayList<>();

                for( Integer integer : notifi){
                    boolean check = noDtoId.contains(integer);
                    if(check == true){
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

            if(courseService.getAllHistory(id).size() != 0) {
                List<Course> listc = new ArrayList<>();
                for (History h : courseService.getAllHistory(id)) {
                    listc.add(courseService.getCourseById(h.getIdc()));
                }
                model.addAttribute("history",listc);
            }

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
    public String goAllCourse(Model model, HttpSession session) {
        String username = (String) session.getAttribute("username");
        int id = userService.getByUser(username).getId();

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(id);
        List<Integer> notifi = notificationService.getAllIdNotificationCourse();

        if(noDtoId.size() != 0){
            List<Notification> isRead = new ArrayList<>();
            List<Notification> unRead = new ArrayList<>();

            for( Integer integer : notifi){
                boolean check = noDtoId.contains(integer);
                if(check == true){
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

        if(courseService.getAllHistory(id).size() != 0) {
            List<Course> listc = new ArrayList<>();
            for (History h : courseService.getAllHistory(id)) {
                listc.add(courseService.getCourseById(h.getIdc()));
            }
            model.addAttribute("history",listc);
        }

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
    public String goAllCourse(@PathVariable int id , Model model, HttpSession session) {

        String username = (String) session.getAttribute("username");
        int id_u = userService.getByUser(username).getId();
        //get in table user-notification
        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(id_u);
        List<Integer> notifi = notificationService.getAllIdNotificationCourse();

        if(noDtoId.size() != 0){
            List<Notification> isRead = new ArrayList<>();
            List<Notification> unRead = new ArrayList<>();

            for( Integer integer : notifi){
                boolean check = noDtoId.contains(integer);
                if(check == true){
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

        if(courseService.getAllHistory(id).size() != 0) {
            List<Course> listc = new ArrayList<>();
            for (History h : courseService.getAllHistory(id)) {
                listc.add(courseService.getCourseById(h.getIdc()));
            }
            model.addAttribute("history",listc);
        }

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
    public String goDetailcousePage(@PathVariable int id ,Model model, HttpSession session) {

        String username = (String) session.getAttribute("username");
        int id_u = userService.getByUser(username).getId();

        boolean flag = courseService.checkHistoryIsExsit(id,id_u);
        if(!flag){
            courseService.addNewHistory(id,id_u);
        }

        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(id_u);
        List<Integer> notifi = notificationService.getAllIdNotificationCourse();

        if(noDtoId.size() != 0){
            List<Notification> isRead = new ArrayList<>();
            List<Notification> unRead = new ArrayList<>();

            for( Integer integer : notifi){
                boolean check = noDtoId.contains(integer);
                if(check == true){
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

        if(courseService.getAllHistory(id_u).size() != 0) {
            List<Course> listc = new ArrayList<>();
            for (History h : courseService.getAllHistory(id_u)) {
                listc.add(courseService.getCourseById(h.getIdc()));
            }
            model.addAttribute("history",listc);
        }

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

    @RequestMapping(value = "/user/khoa-hoc/search",method = RequestMethod.GET)
    @ResponseBody
    public String goSearchCouse(@RequestParam("query") String query) {
        List<Course> listc;
        if(checkRoleSep){
            listc = checkCourse(courseService.searchCourseForSepRole(query));
        }else{
            listc = checkCourse(courseService.searchCourseUser(query));
        }
        int numb = listc.size();
        return String.valueOf(numb);
    }


    @RequestMapping(value = "/user/khoa-hoc/search/{query}",method = RequestMethod.GET)
    public String goSearchCousePage(@PathVariable String query , Model model, HttpSession session) {

        String username = (String) session.getAttribute("username");
        int id = userService.getByUser(username).getId();
        //get in table user-notification
        List<Integer> noDtoId = notificationService.getAllIdOfNotificationForUser(id);
        List<Integer> notifi = notificationService.getAllIdNotificationCourse();

        if(noDtoId.size() != 0){
            List<Notification> isRead = new ArrayList<>();
            List<Notification> unRead = new ArrayList<>();

            for( Integer integer : notifi){
                boolean check = noDtoId.contains(integer);
                if(check == true){
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

        if(courseService.getAllHistory(id).size() != 0) {
            List<Course> listc = new ArrayList<>();
            for (History h : courseService.getAllHistory(id)) {
                listc.add(courseService.getCourseById(h.getIdc()));
            }
            model.addAttribute("history",listc);
        }

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
