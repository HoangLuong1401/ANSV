package ansv.vn.controller.security;

import ansv.vn.entity.User;
import ansv.vn.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.AuthenticationException;
import javax.naming.AuthenticationNotSupportedException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Hashtable;

@Controller
public class LoginController {

    @Autowired
    private UserService usersService;

//     Hàm check tài khoản login tương ứng trên LDAP
    public String ldapAuthentication(String username, String password) {
        String result = "1";

        String url = "ldap://172.24.104.6:389";
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, url);
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, username);
        env.put(Context.SECURITY_CREDENTIALS, password);

        try {
            DirContext ctx = new InitialDirContext(env);
            System.out.println("Connected");
            System.out.println(ctx.getEnvironment());

            // do something useful with the context...

            ctx.close();

        } catch (AuthenticationNotSupportedException ex) {
            System.out.println("The authentication is not supported by the server");
            result = "0";
        } catch (AuthenticationException ex) {
            System.out.println("incorrect password or username");
            result = "0";
        } catch (NamingException ex) {
            System.out.println("error when trying to create the context");
            result = "0";
        }
        return result;
    }

    @RequestMapping(value = "/compare_role_user", method = RequestMethod.POST)
    public @ResponseBody
    String compareRole(HttpServletRequest request) {

        ArrayList<String> role_special = new ArrayList<String>();
        role_special.add("ROLE_ADMIN_COURSE");
        role_special.add("ROLE_ADMIN_WEB");
        role_special.add("ROLE_DF");
        role_special.add("ROLE_USER");
        role_special.add("ROLE_ADMIN");


        String result = "0";
        String username = request.getParameter("username");

        String display_name = request.getParameter("display_name");
        int check = 0;

        if (usersService.checkUserExist(username) == 1) {
                String role_database = usersService.findRoleByUser(username);
                if(role_special.contains(role_database)){
                    System.out.println(role_special.contains(role_database));
                    result = "1";
                }

        } else {
                System.out.println("OK  for j - 2");
                System.out.println("Insert new User");
                // Nếu chưa tồn tại => Tạo mới user và role cho user đó
                User data_user_insert = new User();
                data_user_insert.setId((usersService.count() + 1));
                data_user_insert.setUsername(username);
                data_user_insert.setPassword("{noop}");
                data_user_insert.setDisplay_name(display_name);
                data_user_insert.setEnabled(1);
                data_user_insert.setCreated_by("System");

                usersService.save(data_user_insert); // Lưu user
                usersService.saveRoleForUser(username); // Cấp role cho user
            }


        if (check != 0) {
            result = "1";
        }

        return result;
    }

    @RequestMapping("/login_admin")
    public String login1(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.isEmpty()) {
            if (message.equals("logout")) {
                model.addAttribute("message", "Logout!");
            }
            if (message.equals("error")) {
                model.addAttribute("message", "Login Failed!");
            }
        }
        return "admin/login_admin";
    }

    @RequestMapping("/login_user")
    public String login2(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.isEmpty()) {
            if (message.equals("logout")) {
                model.addAttribute("message", "Logout!");
            }
            if (message.equals("error")) {
                model.addAttribute("message", "Login Failed!");
            }
        }
        return "admin/login_user";
    }

    @RequestMapping("/login_success_admin")
    public String loginSuccess(HttpServletRequest request, HttpSession session, Authentication authentication) {
        System.out.println("ss");
        String userName = "- (*)Chưa đăng nhập!";
        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userName = userDetails.getUsername();
            session.setAttribute("display_name", usersService.getByUser(userName).getDisplay_name());
            session.setAttribute("username", userName);

            // Check user's role and then redirect
            if (request.isUserInRole("ROLE_ADMIN_WEB")) {
                return "redirect:/admin/web/quan-ly/slideshow";
            }

            if (request.isUserInRole("ROLE_ADMIN_COURSE")) {
                return "redirect:/admin/khoa-hoc/quan-ly/ban";
            }

            if (request.isUserInRole("ROLE_ADMIN")) {
                session.setAttribute("show",1);
                return "redirect:/admin/redircet";
            }
            // End: Check user's role and then redirect
        }
        return "redirect:/somthingwrong";
    }

    @RequestMapping("/admin/redircet")
    public String redirectOfAdmin(Model model)  {
        model.addAttribute("redircet",0);
        return "admin/redirectPage";
    }

    @RequestMapping("/noi-bo")
    public String goCourse_HomePage(){
        return "redirect:/login_user";
    }

}
