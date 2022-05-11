package ansv.vn.dao;

import ansv.vn.entity.NewsType;
import ansv.vn.entity.NewsTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class NewsTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<NewsType> findAll() {
        String sql = "SELECT * FROM news_type";
        return jdbcTemplate.query(sql, new NewsTypeMapper());
    }

}
