package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class HighlightMapper implements RowMapper<Highlight> {
    @Override
    public Highlight mapRow(ResultSet rs, int i) throws SQLException {
        Highlight highlight = new Highlight();

        highlight.setId(rs.getInt("id"));
        highlight.setImg(rs.getString("img"));
        highlight.setHeader_title(rs.getString("header_title"));
        highlight.setTitle(rs.getString("title"));
        highlight.setSub_title(rs.getString("sub_title"));
        highlight.setContent(rs.getString("content"));
        highlight.setUrl(rs.getString("url"));
        highlight.setUpdated_at(rs.getDate("updated_at"));
        highlight.setUpdated_by(rs.getString("updated_by"));

        return highlight;
    }
}
