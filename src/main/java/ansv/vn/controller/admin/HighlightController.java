package ansv.vn.controller.admin;

import ansv.vn.entity.Highlight;
import ansv.vn.service.admin.HighlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class HighlightController {

    @Autowired
    private HighlightService highlightService;

    @RequestMapping(value={"/admin/web/quan-ly/highlight"})
    public String listNews(Model model) {
        model.addAttribute("redirect", 1);
        model.addAttribute("listHighlight", highlightService.findAll());
        return "admin/highlight/highlight_list";

    }

    @RequestMapping("/admin/web/quan-ly/highlight/update/{id}")
    public String updateHighlight(@PathVariable int id, Model model, HttpServletRequest request) {
        model.addAttribute("redirect", 1);
        Highlight highlight = highlightService.findById(id);
        model.addAttribute("highlight", highlight);
        return "admin/highlight/highlight_update";
    }

    @RequestMapping("/admin/web/quan-ly/updateHighlight")
    public String doUpdateHighlight(@RequestParam("fileup") CommonsMultipartFile file, @ModelAttribute("Highlight") Highlight highlight, HttpSession s, Model model) {
        byte[] data = file.getBytes();
        //we have to save this file to server...
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "user" + File.separator + "img" + File.separator + "noi_bat" + File.separator + file.getOriginalFilename();
        System.out.println(path);

        try {
            FileOutputStream fos = new FileOutputStream(path);

            // Tiến hành lưu file
            fos.write(data);
            fos.close();
            System.out.println("File uploaded");

            model.addAttribute("msg", "Up ảnh nổi bật thành công!!!");
            model.addAttribute("path", path);
            model.addAttribute("filename", file.getOriginalFilename());

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Uploading error");

            model.addAttribute("msg", "Uploading error!!!");
        }

        highlightService.update(highlight);
        return "redirect:/admin/web/quan-ly/highlight";
    }
}
