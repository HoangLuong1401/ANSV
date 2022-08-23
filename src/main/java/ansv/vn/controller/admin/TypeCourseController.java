package ansv.vn.controller.admin;

import ansv.vn.entity.CourseType;
import ansv.vn.service.admin.CourseService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TypeCourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/type/delete/{id}",method = RequestMethod.GET)
    public String deleteCourseType(@PathVariable int id, Model model){
        int numc = courseService.getCourseByTypeId(id);
        if(numc != 0){
            model.addAttribute("message","reject");
            return "redirect:/admin/khoa-hoc/quan-ly/course/save";
        }else{
            model.addAttribute("message", BCrypt.hashpw("yes",BCrypt.gensalt(5)));
            courseService.deleteAType(id);
            return "redirect:/admin/khoa-hoc/quan-ly/course/save";
        }
    }

    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/type/save", method = RequestMethod.POST)
    public String insertNewVideo(@ModelAttribute("typeC") CourseType courseType){
        if(courseType.getId() != 0){
            courseService.UpdateAType(courseType);
        }else{
            courseService.InsertAType(courseType);
        }
    return "redirect:/admin/khoa-hoc/quan-ly/course/save";
    }
}
