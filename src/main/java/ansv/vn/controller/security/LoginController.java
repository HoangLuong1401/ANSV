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

    private ArrayList<String> role_accept_for_admin = new ArrayList<>();
    private ArrayList<String> role_accept_for_user = new ArrayList<>();
    //Change compare_user
    public LoginController() {
        role_accept_for_admin.add("ROLE_CEO");
        role_accept_for_admin.add("ROLE_ADMIN_COURSE");
        role_accept_for_admin.add("ROLE_ADMIN_WEB");

        role_accept_for_user.add("ROLE_CEO");
        role_accept_for_user.add("ROLE_ADMIN_COURSE");
        role_accept_for_user.add("ROLE_ADMIN_WEB");
        role_accept_for_user.add("ROLE_DF");
    }

    protected void addNewAccount(String username, String display_name, String role){
        User user = new User();
        user.setUsername(username);
        user.setPassword("{noop}");
        user.setDisplay_name(display_name);
        user.setEnabled(1);
        user.setCreated_by("system");
        usersService.saveLogin(user);
        usersService.saveRoleLogin(username, role);
    }

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
    public @ResponseBody String compareRole(HttpServletRequest request) {
        String login_status = request.getParameter("login_status");

        String result = "0";
        String username = request.getParameter("username");
        String display_name = request.getParameter("display_name");
        String role = "";
        String size_role = request.getParameter("size_role");
        int status = 0, role_df = 0;

        if (login_status.contains("1")) {
            int index_df = 0;
                //Check role admin login
                // Vòng lặp kiểm tra role lớn nhất user có, so sánh với role được cấp trên database => Nếu khác, thực hiện update role mới trên database
                for (int j = 1; j <= Integer.parseInt(size_role); j++) {
                    role = request.getParameter("role" + j);

                    if (role_accept_for_admin.contains(role.trim()) && status == 0) {

                        if (usersService.checkUserExist(username) != 0) {
                            // Nếu tồn tại user trên DB
                            if (usersService.checkUsersRoleExist(username, role) == 0) {
                                // Nếu ko tồn tại role user trên DB = role LDAP -> update role
                                usersService.updateRoleByUser(username, role);
                            }
                        } else {
                            // Nếu ko tồn tại user -> insert user + insert role
                            addNewAccount(username,display_name,role);
                        }
                        result = "1";
                        status = 1;
                    }

                    if(role.contains("ROLE_DF")){
                        index_df = 1;
                    }
                }

            if (usersService.checkUserExist(username) != 0){
                if (usersService.checkUsersRoleExist(username, "ROLE_DF") != 0 ||
                        usersService.checkUsersRoleExist(username, "ROLE_USER") != 0) {
                    result = "1";
                }
            }else{
                if(index_df == 1){
                    addNewAccount(username,display_name,"ROLE_DF");
                }else {
                    addNewAccount(username,display_name,"ROLE_USER");
                }

            }
        }else if(login_status.contains("2")){
            int index_df = 0;
            for (int j = 1; j <= Integer.parseInt(size_role); j++) {
                role = request.getParameter("role" + j);

                if (role_accept_for_user.contains(role.trim()) && status == 0) {

                    if (usersService.checkUserExist(username) != 0) {
                        // Nếu tồn tại user trên DB
                        if (usersService.checkUsersRoleExist(username, role) == 0) {
                            // Nếu ko tồn tại role user trên DB = role LDAP -> update role
                            usersService.updateRoleByUser(username, role);
                            return "1";
                        }
                    } else {
                        // Nếu ko tồn tại user -> insert user + insert role
                        addNewAccount(username,display_name,role);
                        return "1";
                    }
                    status = 1;
                }
            }
            if (usersService.checkUserExist(username) != 0){
                if (usersService.checkUsersRoleExist(username, "ROLE_USER") != 0) {
                    result = "1";
                }
            }else{
                addNewAccount(username,display_name,"ROLE_USER");
            }
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
    public String loginSuccess(HttpServletRequest request, HttpSession session, Authentication authentication, Model model) {
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

            if (request.isUserInRole("ROLE_CEO")) {
                session.setAttribute("show",1);
                return "redirect:/admin/redircet";
            }
            // End: Check user's role and then redirect
        }
        model.addAttribute("message", "Bạn không có quyền login vào trang này!!!");
        return "redirect:/login_admin";
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
