package ansv.vn.controller.admin;

import ansv.vn.entity.Course;
import ansv.vn.entity.Video;
import ansv.vn.service.admin.CourseService;
import ansv.vn.service.admin.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class VideoController {

    @Autowired
    private VideoService videoService;


    //Admin
    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/video/save_{id}", method = RequestMethod.POST)
    public String insertNewVideo(@PathVariable int id, @ModelAttribute("video") Video video){
        video.setId_course(id);
        videoService.InsertVideoByCourseId(video);
        return "redirect:/admin/khoa-hoc/quan-ly/course/detail/"+id;
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/video/delete/{idc}_{idv}")
    public String delateAVideo(@PathVariable int idv, @PathVariable int idc){
        videoService.deleteVideoById(idv);
        return "redirect:/admin/khoa-hoc/quan-ly/course/detail/"+idc;
    }

    //User

}
