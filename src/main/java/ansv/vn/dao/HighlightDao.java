package ansv.vn.dao;

import ansv.vn.entity.Highlight;
import ansv.vn.entity.HighlightMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class HighlightDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();

    public void save(Highlight highlight) {
        String sql = "INSERT INTO highlight (img, header_title, title, sub_title, content, url, updated_at, updated_by) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, highlight.getImg(), highlight.getHeader_title(), highlight.getTitle()
                , highlight.getSub_title(), highlight.getContent(), highlight.getUrl(), _now, highlight.getUpdated_by());
    }

    public void delete(int id) {
        String sql = "DELETE FROM highlight WHERE id = " + id;
        jdbcTemplate.update(sql);
    }

    public void update(Highlight highlight) {
        String sql = "UPDATE highlight SET img = ?, header_title = ?, title = ?, sub_title = ?, content = ?, url = ?, "
                + "updated_at = ?, updated_by = ? WHERE id = ? ";
        jdbcTemplate.update(sql, highlight.getImg(), highlight.getHeader_title(), highlight.getTitle()
                , highlight.getSub_title(), highlight.getContent(), highlight.getUrl(), _now, highlight.getUpdated_by()
                , highlight.getId());
    }

    public Highlight findById(int id) {
        String sql = "SELECT * FROM highlight WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new HighlightMapper(), id);
    }

    public List<Highlight> findAll() {
        String sql = "SELECT * FROM highlight";
        return jdbcTemplate.query(sql, new HighlightMapper());
    }
}
