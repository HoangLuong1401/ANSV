package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SlideShowMapper implements RowMapper<SlideShow> {
    public SlideShow mapRow(ResultSet rs, int i) throws SQLException {
        SlideShow slideshow = new SlideShow();

        slideshow.setId(rs.getInt("id"));
        slideshow.setImg(rs.getString("img"));
        slideshow.setCaption(rs.getString("caption"));
        slideshow.setContent(rs.getString("content"));
        slideshow.setUrl(rs.getString("url"));
        slideshow.setUpdated_at(rs.getDate("updated_at"));
        slideshow.setUpdated_by(rs.getString("updated_by"));

        return slideshow;
    }
}
