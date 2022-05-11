package ansv.vn.dao;

import ansv.vn.entity.User;
import ansv.vn.entity.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();

    public User getByUser(String username) {
        String sql = "SELECT users.id, users.username, users.display_name, role.id AS role,  "
                + "users.enabled FROM users INNER JOIN users_roles "
                + "on users.id = users_roles.user INNER JOIN role on users_roles.role = role.id WHERE username = ? ";
        return jdbcTemplate.queryForObject(sql, new UserMapper(), username);

    }

    // Kiểm tra username đã tồn tại trên database chưa
    public int checkUserExist(String username) {
        String sql = "SELECT count(*) FROM users WHERE username = ?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return result;
    }

    // Kiểm tra role trên LDAP với role sãn có trên database
    public int checkUsersRoleExist(String username, String role) {
        String sql = "SELECT count(*) FROM role "
                + "INNER JOIN users_roles ON role.id = users_roles.role "
                + "INNER JOIN users ON users_roles.user = users.id "
                + "WHERE users.username = ? AND role.name = ?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, username, role);
        return result;
    }

    // Cập nhật role của user
    public void updateRoleByUser(String username, String role) {
        String sql = "UPDATE users_roles "
                + "SET users_roles.role = (SELECT role.id FROM role WHERE role.name = ?) "
                + "WHERE user = (SELECT users.id FROM users WHERE users.username = ?)";
        jdbcTemplate.update(sql, role, username);
    }

    // lấy về role database

    // Truy vấn role của user
    public String findRoleByUser(String username) {
        String sql = "SELECT role.name FROM role "
                + "INNER JOIN users_roles ON role.id = users_roles.role "
                + "INNER JOIN users ON users_roles.user = users.id "
                + "WHERE users.username = ?";
        String result = jdbcTemplate.queryForObject(sql, String.class, username);
        return result;
    }

    public int count() {
        String sql = "SELECT COUNT(*) FROM users";
        int result = jdbcTemplate.queryForObject(sql, Integer.class);
        return result;
    }

    // Insert user
    public void save(User users) {
        String sql = "INSERT INTO users (id, username, password, display_name, enabled, created_at, created_by) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, users.getId(), users.getUsername(), users.getPassword(), users.getDisplay_name(),
                users.getEnabled(), _now, users.getCreated_by());
    }

    // Thêm role cho user
    public void saveRoleForUser(String username) {
        String sql = "INSERT INTO users_roles (user, role) VALUES ((SELECT users.id FROM users WHERE users.username = ?),2)";
        jdbcTemplate.update(sql, username);
    }
}
