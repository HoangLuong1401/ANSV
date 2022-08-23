package ansv.vn.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentMapper  implements RowMapper<Comments> {
    @Override
    public Comments mapRow(ResultSet rs, int i) throws SQLException {

        Comments comments = new Comments();
        comments.setId_u(rs.getInt("id_u"));
        comments.setId_c(rs.getInt("id_c"));
        comments.setCmt(rs.getString("str_cmt"));
        comments.setDayup(rs.getString("dayup"));

        return comments;
    }
}
