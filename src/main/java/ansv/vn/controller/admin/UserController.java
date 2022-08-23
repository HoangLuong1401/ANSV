package ansv.vn.controller.admin;

import ansv.vn.entity.Role;
import ansv.vn.entity.User;
import ansv.vn.service.admin.RoleService;
import ansv.vn.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService user;

    @Autowired
    RoleService roleService;

    @RequestMapping("/admin/khoa-hoc/quan-ly/user")
    public String goViewAccount(Model model){
        List<User> list = user.getAllUser();
        List<Role> list_role = roleService.getAllRole();

        model.addAttribute("redirect", 1);
        model.addAttribute("users", list);
        model.addAttribute("role", list_role);

        return "admin/account/view_accounts";
    }

    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/user/changeRole",method = RequestMethod.GET)
    @ResponseBody
    public String goSearchCourseAdmin(HttpServletRequest request) {
        String id_u = request.getParameter("id_u");
        String id_c = request.getParameter("id_r");
        roleService.updateRole(Integer.parseInt(id_u), Integer.parseInt(id_c));

        return "1";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/user/look-user/{name}_{enabled}")
    public String goLockAccount(@PathVariable String name, @PathVariable int enabled, Model model){

        if (enabled == 1){
            user.changeEnableOfUser(name,0);
        }else {
            user.changeEnableOfUser(name,1);
        }

        return "redirect:/admin/khoa-hoc/quan-ly/user";
    }
}
