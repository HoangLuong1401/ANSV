package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseMapper implements RowMapper<Course> {
    @Override
    public Course mapRow(ResultSet rs, int i) throws SQLException {
        Course c = new Course();

        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        c.setDescription(rs.getString("contents"));
        c.setId_depenment(rs.getInt("id_dep"));
        c.setId_type(rs.getInt("id_type"));
        c.setUrl_img(rs.getString("img_url"));
        c.setCreate_by(rs.getString("created_by"));
        c.setCreate_date(rs.getString("created_date"));

        return c;
    }
}
