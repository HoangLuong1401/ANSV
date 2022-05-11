package ansv.vn.controller.admin;

import ansv.vn.entity.Course;
import ansv.vn.entity.Department;
import ansv.vn.service.admin.CourseService;
import ansv.vn.service.admin.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private CourseService courseService;

    @RequestMapping("/admin/khoa-hoc/quan-ly/ban")
    public String goProcessDepartment(Model model, HttpServletRequest request, HttpSession session){

        model.addAttribute("redirect", 1);

        List<Department> listdep = departmentService.getAllDepartmentForAdmin();
        for (Department departments : listdep) {
            List<Course> listCou = courseService.getDataCouseraByIdDep(departments.getId());
            departments.setCourseList(listCou);
        }


        model.addAttribute("department", listdep);
        return "admin/department/department_view";
    }

    @RequestMapping(value = {"/admin/khoa-hoc/quan-ly/ban/insert" }, method = RequestMethod.POST)
    public String doSaveDepartmemt(@ModelAttribute("department") Department departments, Model model) {
        departmentService.insertDepartment(departments);
        model.addAttribute("department", departmentService.getAllDepartmentForAdmin());
        return "redirect:/admin/khoa-hoc/quan-ly/ban";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/ban/save")
    public String insertDepartment(Model model) {
        model.addAttribute("redirect", 1);
        model.addAttribute("department", new Department());
        return "admin/department/departmemt_save";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/ban/update/{id}")
    public String updateDepartment(@PathVariable int id, Model model) {
        model.addAttribute("redirect", 1);
        model.addAttribute("department",  departmentService.getDepartmentById(id));
        return "admin/department/department_edit";
    }

    @RequestMapping(value = {"/admin/khoa-hoc/quan-ly/update" }, method = RequestMethod.POST)
    public String doUpdateDepartment(@ModelAttribute("department") Department departments, Model model) {
        departmentService.updateDepartment(departments);

        return "redirect:/admin/khoa-hoc/quan-ly/ban";
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/ban/delete/{id}")
    public String doDeleteDepartment(@PathVariable int id, Model model) {

        List<Course> listCou = courseService.getDataCouseraByIdDep(id);
        if(!listCou.isEmpty()){
            courseService.deleteCourseByIdDep(id);
        }
        departmentService.deleteDepartment(id);
        return "redirect:/admin/khoa-hoc/quan-ly/ban";
    }
}
