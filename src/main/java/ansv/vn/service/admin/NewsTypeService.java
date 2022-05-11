package ansv.vn.service.admin;

import ansv.vn.dao.NewsTypeDao;
import ansv.vn.entity.NewsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsTypeService {

    @Autowired
    private NewsTypeDao newstypeDao;

    public List<NewsType> findAll() {
        return newstypeDao.findAll();
    }
}
