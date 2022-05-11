package ansv.vn.controller.admin;

import ansv.vn.entity.Notification;
import ansv.vn.service.admin.NotificationService;
import ansv.vn.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class NotificationController {

    @Autowired
    private UserService userService;

    @Autowired
    private NotificationService notificationService;


    //Admin
    @RequestMapping("/admin/khoa-hoc/quan-ly/notification")
    public String goProcessNotificaton(Model model){
        model.addAttribute("redirect", 1);
        model.addAttribute("notifi",notificationService.getAllDataNotofi());
        return "admin/notification/view_notification";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/notification/save")
    public String goSaveNotificaton(Model model){
        model.addAttribute("redirect", 1);
        model.addAttribute("notifi", new Notification());
        return "admin/notification/add_notification";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/saveNotification")
    public String saveNotificaton(Model model, @ModelAttribute("notifi") Notification notification){
        if(notification.getContent().equals("")){
            model.addAttribute("error","Nội dung rỗng - vui lòng thêm nội dung");
            return "admin/notification/add_notification";
        }else {
            notificationService.saveNotificationById(notification);
            return "redirect:/admin/khoa-hoc/quan-ly/notification";
        }
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/notification/update/{id}")
    public String goUpdateNotificaton(Model model, @PathVariable int id){
        model.addAttribute("redirect", 1);
        model.addAttribute("notifi", notificationService.getDataNotificationById(id));
        return "admin/notification/edit_notificaion";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/updateNotification")
    public String updateNotificaton( @ModelAttribute("notifi") Notification notification){
        notificationService.updateNotification(notification);
        return "redirect:/admin/khoa-hoc/quan-ly/notification";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/notification/delete/{id}")
    public String deleteNotificaton(@PathVariable int id){
        notificationService.deleteNotificationUserById(id);
        notificationService.deleteNotificationById(id);
        return "redirect:/admin/khoa-hoc/quan-ly/notification";
    }

    //User
    @RequestMapping(value = "/user/khoa-hoc/processNotifications", method = RequestMethod.GET)
    public @ResponseBody void postEmployeeData(@RequestParam("id") int id, HttpSession session) {
        // process the developer object
        // Your implementation. For demo I hard-coded the Defect counts
        String username = (String) session.getAttribute("username");
        int id_u =  userService.getByUser(username).getId();

        boolean flag = notificationService.checkNotificationIsExsit(id,id_u);
        if(flag == false){
            notificationService.saveIsReadNotification(id,id_u);
        }
    }
}
