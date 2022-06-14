package ansv.vn.controller.web;

import ansv.vn.service.admin.HighlightService;
import ansv.vn.service.admin.NewsService;
import ansv.vn.service.admin.NewsTypeService;
import ansv.vn.service.admin.SlideShowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    private final SlideShowService slideshowService;

    private final HighlightService highlightService;

    private final NewsService newsService;

    private final NewsTypeService newsTypeService;

    private ModelAndView _mvShare = new ModelAndView();

    public HomeController(SlideShowService slideshowService, HighlightService highlightService, NewsService newsService, NewsTypeService newsTypeService) {
        this.slideshowService = slideshowService;
        this.highlightService = highlightService;
        this.newsService = newsService;
        this.newsTypeService = newsTypeService;
    }

    @RequestMapping(value = { "/", "/trang-chu" }, method = RequestMethod.GET)
    public ModelAndView indexWeb() {
        _mvShare.addObject("slideshow", slideshowService.findAll());
        _mvShare.addObject("highlight", highlightService.findAll());
        _mvShare.addObject("news", newsService.findLimit());
        _mvShare.setViewName("web/home");
        return _mvShare;
    }

    @RequestMapping(value = "/ve-chung-toi", method = RequestMethod.GET)
    public ModelAndView aboutPage() {
        _mvShare.setViewName("web/about_us");
        return _mvShare;
    }

    @RequestMapping(value = "/to-chuc", method = RequestMethod.GET)
    public ModelAndView structurePage() {
        _mvShare.setViewName("web/structure");
        return _mvShare;
    }

    @RequestMapping(value = "/cong-nghe-thong-tin", method = RequestMethod.GET)
    public ModelAndView ifTechnologyPage() {
        _mvShare.setViewName("web/if_technology");
        return _mvShare;
    }

    @RequestMapping(value = "/lich-su", method = RequestMethod.GET)
    public ModelAndView historyPage() {
        _mvShare.setViewName("web/history_timeline");
        return _mvShare;
    }

    @RequestMapping(value = "/thong-diep", method = RequestMethod.GET)
    public ModelAndView thongDiep() {
        _mvShare.setViewName("web/thong_diep");
        return _mvShare;
    }

    @RequestMapping(value = "/khach-hang", method = RequestMethod.GET)
    public ModelAndView clientPage() {
        _mvShare.setViewName("web/client");
        return _mvShare;
    }

    @RequestMapping(value = "/san-pham-thuong-mai", method = RequestMethod.GET)
    public ModelAndView productCommerPage() {
        _mvShare.setViewName("web/product-commer-new");
        return _mvShare;
    }

    @RequestMapping(value = "/san-pham-cong-nghe-cong-nghiep", method = RequestMethod.GET)
    public ModelAndView productInformationPage() {
        _mvShare.setViewName("web/product_information");
        return _mvShare;
    }
    @RequestMapping(value = "/du-an-tieu-bieu", method = RequestMethod.GET)
    public ModelAndView hightlightPage() {
        _mvShare.setViewName("web/hightlight");
        return _mvShare;
    }

    @RequestMapping(value = "/chuyen-nganh-vien-thong", method = RequestMethod.GET)
    public ModelAndView telecomPage() {
        _mvShare.setViewName("web/telecom");
        return _mvShare;
    }

    @RequestMapping(value = "/chuyen-doi-so", method = RequestMethod.GET)
    public ModelAndView nbConvertPage() {
        _mvShare.setViewName("web/nb_convert");
        return _mvShare;
    }

    @RequestMapping(value = "/dich-vu", method = RequestMethod.GET)
    public ModelAndView servicePage() {
        _mvShare.setViewName("web/service");
        return _mvShare;
    }

    @RequestMapping(value = "/chi-tiet-san-pham", method = RequestMethod.GET)
    public ModelAndView producDetailPage() {
        _mvShare.setViewName("web/product_detail");
        return _mvShare;
    }

    @RequestMapping(value = "/tin-tuc", method = RequestMethod.GET)
    public ModelAndView newsPage() {
        _mvShare.addObject("news_type", newsTypeService.findAll());
        _mvShare.addObject("news", newsService.findAllNews());

        _mvShare.addObject("news1", newsService.findLimitByType1());
        _mvShare.addObject("news2", newsService.findLimitByType2());
        _mvShare.addObject("news3", newsService.findLimitByType3());

        _mvShare.setViewName("web/news");
        return _mvShare;
    }

    @RequestMapping(value = "/lien-he", method = RequestMethod.GET)
    public ModelAndView contactPage() {
        _mvShare.setViewName("web/contact");
        return _mvShare;
    }



    /* Chi tiết sản phẩm */

    @RequestMapping(value = "/HVIP01", method = RequestMethod.GET)
    public ModelAndView HVIP01() {
        _mvShare.setViewName("web/product_detail/HVIP01");
        return _mvShare;
    }

    @RequestMapping(value = "/HVOF01", method = RequestMethod.GET)
    public ModelAndView HVOF01() {
        _mvShare.setViewName("web/product_detail/HVOF01");
        return _mvShare;
    }

    @RequestMapping(value = "/Sm_box2", method = RequestMethod.GET)
    public ModelAndView Sm_box2() {
        _mvShare.setViewName("web/product_detail/Sm_box2");
        return _mvShare;
    }

    @RequestMapping(value = "/Sm_box2_ATV", method = RequestMethod.GET)
    public ModelAndView Sm_box2_ATV() {
        _mvShare.setViewName("web/product_detail/Sm_box2_ATV");
        return _mvShare;
    }

    @RequestMapping(value = "/EW12S_SG", method = RequestMethod.GET)
    public ModelAndView EW12S_SG() {
        _mvShare.setViewName("web/product_detail/EW12S_SG");
        return _mvShare;
    }

    @RequestMapping(value = "/EW12C_CG", method = RequestMethod.GET)
    public ModelAndView EW12C_CG() {
        _mvShare.setViewName("web/product_detail/EW12C_CG");
        return _mvShare;
    }

    @RequestMapping(value = { "/GW040_H" }, method = RequestMethod.GET)
    public ModelAndView GW040_H() {
        _mvShare.setViewName("web/product_detail/GW040_H");
        return _mvShare;
    }

    @RequestMapping(value = { "/GW020_H" }, method = RequestMethod.GET)
    public ModelAndView GW020_H() {
        _mvShare.setViewName("web/product_detail/GW020_H");
        return _mvShare;
    }

    @RequestMapping(value = { "/22N_01" }, method = RequestMethod.GET)
    public ModelAndView I22N_01() {
        _mvShare.setViewName("web/product_detail/22N_01");
        return _mvShare;
    }

    @RequestMapping(value = { "/MR4G_11D" }, method = RequestMethod.GET)
    public ModelAndView MR4G_11D() {
        _mvShare.setViewName("web/product_detail/MR4G_11D");
        return _mvShare;
    }

    @RequestMapping(value = { "/GW240_H" }, method = RequestMethod.GET)
    public ModelAndView GW240_H() {
        _mvShare.setViewName("web/product_detail/GW240_H");
        return _mvShare;
    }

    /* Tin tức */
    @RequestMapping(value = { "/mesh_vs_rep" }, method = RequestMethod.GET)
    public ModelAndView mesh_vs_rep() {
        _mvShare.setViewName("web/news/mesh_vs_rep");
        return _mvShare;
    }
    
    @RequestMapping(value = { "/chao-gia" }, method = RequestMethod.GET)
	public ModelAndView chao_gia() {
		ModelAndView mav = new ModelAndView("web/chao-gia");
		return mav;
	}
    
    @RequestMapping(value = { "/tuyen_dung" }, method = RequestMethod.GET)
	public ModelAndView tuyen_dung() {
		ModelAndView mav = new ModelAndView("web/tuyen_dung");
		return mav;
	}

    @RequestMapping(value = { "detail_{id}" }, method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable int id) {
		_mvShare.addObject("get_new",newsService.findByID(id));
		_mvShare.setViewName("web/detail");
		return _mvShare;
	}
}
