package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseTypeMapper implements RowMapper<CourseType> {
    @Override
    public CourseType mapRow(ResultSet rs, int i) throws SQLException {

        CourseType type = new CourseType();

        type.setId(rs.getInt("id"));
        type.setName_tpye(rs.getString("name"));
        type.setDescription_type(rs.getString("description"));

        return type;
    }
}
