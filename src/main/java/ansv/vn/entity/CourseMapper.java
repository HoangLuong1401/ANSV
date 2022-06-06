package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseMapper implements RowMapper<Course> {
    @Override
    public Course mapRow(ResultSet rs, int i) throws SQLException {
        Course c = new Course(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("contents"),
                rs.getInt("id_dep"),
                rs.getInt("id_type"),
                rs.getString("img_url"),
                rs.getString("created_by"),
                rs.getString("created_date")
        );

        return c;
    }
}
