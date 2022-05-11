package ansv.vn.controller.admin;

import ansv.vn.entity.Document;
import ansv.vn.service.admin.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DocumentController {

    @Autowired
    private DocumentService documentService;

    //Admin
    @RequestMapping(value = "/admin/khoa-hoc/quan-ly/doc/save_{id}", method = RequestMethod.POST)
    public String insertNewDoc(@PathVariable int id, @ModelAttribute("doc") Document document){
        documentService.insertsDoc(document,id);
        return "redirect:/admin/khoa-hoc/quan-ly/course/detail/"+id;
    }

    @RequestMapping("/admin/khoa-hoc/quan-ly/doc/delete/{idc}_{idd}")
    public String deleteADoc(@PathVariable int idd, @PathVariable int idc){
        documentService. deleteADocById(idd);
        return "redirect:/admin/khoa-hoc/quan-ly/course/detail/"+idc;
    }

    //User
}
