package ansv.vn.service.admin;

import ansv.vn.dao.NewsDao;
import ansv.vn.dto.NewsDto;
import ansv.vn.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    private NewsDao newsDao;

    public List<News> findAll() {
        return newsDao.findAll();
    }

    public NewsDto findByID(int id) {
        return newsDao.findByID(id);
    }

    public List<NewsDto> findAllNews() {
        return newsDao.findAllNews();
    }

    public List<News> findLimit() {
        return newsDao.findLimit();
    }

    public News findById(int id) {
        return newsDao.findById(id);
    }

    public void save(News news){
        // validate business
        newsDao.save(news);
    }

    public void update(News news){
        // validate business
        newsDao.update(news);
    }

    public void delete(int id){
        // validate business
        newsDao.delete(id);
    }

    public List<NewsDto> findLimitByType1() {
        return newsDao.findLimitByType1();
    }
    public List<NewsDto> findLimitByType2() {
        return newsDao.findLimitByType2();
    }
    public List<NewsDto> findLimitByType3() {
        return newsDao.findLimitByType3();
    }
    public List<NewsDto> findLimitByType4() {
        return newsDao.findLimitByType4();
    }
}
