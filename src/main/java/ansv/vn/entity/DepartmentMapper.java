package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DepartmentMapper implements RowMapper<Department> {
    @Override
    public Department mapRow(ResultSet rs, int rowNum) throws SQLException {
        Department department = new Department(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("full_name"),
                rs.getString("created_by"),
                rs.getString("created_date")
        );
        return department;
    }
}
