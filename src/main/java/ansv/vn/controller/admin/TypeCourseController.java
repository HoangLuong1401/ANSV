package ansv.vn.controller.admin;

import ansv.vn.entity.CourseType;
import ansv.vn.entity.Video;
import ansv.vn.service.admin.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class TypeCourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/admin/khoa-hoc/quan-ly/type/delete")
    @ResponseBody
    public String deleteCourseType(@RequestParam int id){
        int numc = courseService.getCourseByTypeId(id);
        if(numc != 0){
            return String.valueOf(numc);
        }else{
            courseService.deleteAType(id);
            return "DELETE SUCCESSFULLY";
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
