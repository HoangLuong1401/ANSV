package ansv.vn.controller.admin;

import ansv.vn.entity.News;
import ansv.vn.service.admin.NewsService;
import ansv.vn.service.admin.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsTypeService newsTypeService;

    @RequestMapping(value={"/admin/web/quan-ly/news"})
    public String listNews(Model model) {

        model.addAttribute("redirect", 1);
        model.addAttribute("listNews", newsService.findAllNews());
        return "admin/news/news_list";

    }

    @RequestMapping("/admin/web/quan-ly/news/save")
    public String insertNews(Model model) {

        model.addAttribute("redirect", 1);
        model.addAttribute("listNews_type", newsTypeService.findAll());
        model.addAttribute("news", new News());
        return "admin/news/news_save";
    }

    @RequestMapping(value = {"/admin/web/quan-ly/saveNews" }, method = RequestMethod.POST)
    public String doSaveNews(@RequestParam("fileup") CommonsMultipartFile file, @ModelAttribute("News") News news, HttpSession s, Model model) {

        byte[] data = file.getBytes();
        //we have to save this file to server...
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "user"
                + File.separator + "img" + File.separator + "news" + File.separator + file.getOriginalFilename();
        System.out.println(path);

        try {
            FileOutputStream fos = new FileOutputStream(path);

            // Tiến hành lưu file
            fos.write(data);
            fos.close();
            System.out.println("File uploaded");

            model.addAttribute("msg", "Uploaded successfully");
            model.addAttribute("path", path);
            model.addAttribute("filename", file.getOriginalFilename());

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Uploading error");

            model.addAttribute("msg", "Uploading error!!!");
        }

        // Insert data into database
        newsService.save(news);
        return "redirect:/admin/web/quan-ly/news";
    }

    @RequestMapping("/admin/web/quan-ly/news/details/{id}")
    public String newsDetail(@PathVariable int id, Model model) {
        model.addAttribute("redirect", 1);
        model.addAttribute("newDetails", newsService.findByID(id));
        return "admin/news/news_details";
    }

    @RequestMapping("/admin/web/quan-ly/news/update/{id}")
    public String updateNews(@PathVariable int id, Model model) {
        model.addAttribute("redirect", 1);
        News news = newsService.findById(id);
        model.addAttribute("listNews_type", newsTypeService.findAll());
        model.addAttribute("news", news);
        return "admin/news/news_update";
    }



    @RequestMapping("/admin/web/quan-ly/updateNews")
    public String doUpdateNews(@RequestParam("fileup") CommonsMultipartFile file, @ModelAttribute("News") News news, HttpSession s, Model model) {
        byte[] data = file.getBytes();
        //we have to save this file to server...
        String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "user" + File.separator + "img" + File.separator + "news" + File.separator + file.getOriginalFilename();
        System.out.println(path);

        try {
            FileOutputStream fos = new FileOutputStream(path);

            // Tiến hành lưu file
            fos.write(data);
            fos.close();
            System.out.println("File uploaded");

            model.addAttribute("msg", "Uploaded successfully");
            model.addAttribute("path", path);
            model.addAttribute("filename", file.getOriginalFilename());

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Uploading error");

            model.addAttribute("msg", "Uploading error!!!");
        }

        newsService.update(news);
        return "redirect:/admin/web/quan-ly/news";
    }

    @RequestMapping("/admin/web/quan-ly/news/delete/{id}")
    public String doDeleteNews(@PathVariable int id, Model model) {
        newsService.delete(id);
        return "redirect:/admin/web/quan-ly/news";
    }
}
