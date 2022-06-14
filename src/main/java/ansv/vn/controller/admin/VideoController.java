package ansv.vn.controller.admin;


import ansv.vn.entity.Video;

import ansv.vn.service.admin.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class VideoController {

    private final VideoService videoService;

    public VideoController(VideoService videoService) {
        this.videoService = videoService;
    }


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
}
