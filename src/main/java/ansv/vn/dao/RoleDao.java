package ansv.vn.dao;

import ansv.vn.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@Repository
public class RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Role> getAllRole(){
        String sql = "SELECT * FROM role";
        return jdbcTemplate.query(sql, new RowMapper<Role>() {
            @Override
            public Role mapRow(ResultSet rs, int i) throws SQLException {
                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setRole_name(rs.getString("name"));
                return role;
            }
        });
    }

    public void updateRole(int id_u,int id_r){
        String sql = "UPDATE users_roles SET users_roles.role = ? WHERE users_roles.user = ?";
        jdbcTemplate.update(sql,id_r,id_u);
    }


}
