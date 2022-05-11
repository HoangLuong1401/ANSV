package ansv.vn.dao;

import ansv.vn.dto.NewsDto;
import ansv.vn.dto.NewsDtoMapper;
import ansv.vn.entity.News;
import ansv.vn.entity.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class NewsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();

    public void save(News news) {
        String sql = "INSERT INTO news (img, title, summary, content, url, news_type, updated_at, updated_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, news.getImg(), news.getTitle(), news.getSummary(), news.getContent(), news.getUrl(), news.getNews_type(), _now, news.getUpdated_by());
    }

    public void delete(int id) {
        String sql = "DELETE FROM news WHERE id = " + id;
        jdbcTemplate.update(sql);
    }

    public void update(News news) {
        String sql = "UPDATE news SET img = ?, title = ?, summary = ?, content = ?, url = ?, news_type = ?, updated_at = ?, updated_by = ? WHERE id = ? ";
        jdbcTemplate.update(sql, news.getImg(), news.getTitle(), news.getSummary(), news.getContent(), news.getUrl(), news.getNews_type(), _now, news.getUpdated_by(), news.getId());
    }

    public News findById(int id) {
        String sql = "SELECT * FROM news WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new NewsMapper(), id);
    }

    public List<News> findAll() {
        String sql = "SELECT * FROM news";
        return jdbcTemplate.query(sql, new NewsMapper());
    }

    public List<NewsDto> findAllNews() {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "ORDER BY news.id DESC";
        return jdbcTemplate.query(sql, new NewsDtoMapper());
    }

    public NewsDto findByID(int id) {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "WHERE news.id = ?";
        return jdbcTemplate.queryForObject(sql, new NewsDtoMapper(), id);
    }

    public List<News> findLimit() {
        String sql = "SELECT * FROM news order by id desc limit 5";
        return jdbcTemplate.query(sql, new NewsMapper());
    }

    //	Truy vấn 5 bản ghi cùng loại để hiển thị ra màn hình chính của tin tức
    public List<NewsDto> findLimitByType1() {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "WHERE news_type.id = 1 "
                + "ORDER BY news.id DESC "
                + "LIMIT 5";
        return jdbcTemplate.query(sql, new NewsDtoMapper());
    }
    public List<NewsDto> findLimitByType2() {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "WHERE news_type.id = 2 "
                + "ORDER BY news.id DESC "
                + "LIMIT 5";
        return jdbcTemplate.query(sql, new NewsDtoMapper());
    }
    public List<NewsDto> findLimitByType3() {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "WHERE news_type.id = 3 "
                + "ORDER BY news.id DESC "
                + "LIMIT 5";
        return jdbcTemplate.query(sql, new NewsDtoMapper());
    }
    public List<NewsDto> findLimitByType4() {
        String sql = "SELECT news.id, news.img, news.title, news.summary, news.content, news.url, news_type.name AS classify, "
                + "news.updated_at, news.updated_by FROM news INNER JOIN news_type ON news.news_type = news_type.id "
                + "WHERE news_type.id = 4 "
                + "ORDER BY news.id DESC "
                + "LIMIT 5";
        return jdbcTemplate.query(sql, new NewsDtoMapper());
    }
}
