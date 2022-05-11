package ansv.vn.service.admin;

import ansv.vn.dao.SildeShowDao;
import ansv.vn.entity.SlideShow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SlideShowService {

    @Autowired
    private ansv.vn.dao.SildeShowDao sildeShowDao;

    public List<SlideShow> findAll() { return sildeShowDao.findAll(); }

    public SlideShow findById(int id) {
        return sildeShowDao.findById(id);
    }

    public void save(SlideShow slideshow){ sildeShowDao.save(slideshow); }

    public void update(SlideShow slideshow){ sildeShowDao.update(slideshow); }

    public void delete(int id){ sildeShowDao.delete(id); }
}
