package ansv.vn.dao;

import ansv.vn.dto.CommentMapper;
import ansv.vn.dto.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class CommentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Comments> getCommentOfACourseById(int id) {
        String sql = "SELECT * FROM comments WHERE id_c = ?  ORDER BY dayup DESC";
        return jdbcTemplate.query(sql, new CommentMapper(),id);
    }

    public void addAComment(Comments comments){
        String sql = "INSERT INTO comments VALUE (?,?,?,?)";
        jdbcTemplate.update(sql, comments.getId_u(),comments.getId_c(),comments.getCmt(),comments.getDayup());
    }
}
