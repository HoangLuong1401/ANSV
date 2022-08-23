package ansv.vn.dao;

import ansv.vn.entity.User;
import ansv.vn.entity.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

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

    public List<User> getAllUserForAdmin(){
        String sql = "SELECT users.id, users.username, users.display_name, role.id AS role,  "
                + "users.enabled FROM users INNER JOIN users_roles "
                + "on users.id = users_roles.user INNER JOIN role on users_roles.role = role.id";
        return jdbcTemplate.query(sql,new UserMapper());
    }

    // Kiá»ƒm tra username Ä‘Ã£ tá»“n táº¡i trÃªn database chÆ°a
    public int checkUserExist(String username) {
        String sql = "SELECT count(*) FROM users WHERE username = ?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return result;
    }

    // Kiá»ƒm tra role trÃªn LDAP vá»›i role sÃ£n cÃ³ trÃªn database
    public int checkUsersRoleExist(String username, String role) {
        String sql = "SELECT count(*) FROM role "
                + "INNER JOIN users_roles ON role.id = users_roles.role "
                + "INNER JOIN users ON users_roles.user = users.id "
                + "WHERE users.username = ? AND role.name = ?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, username, role);
        return result;
    }

    // Cáº­p nháº­t role cá»§a user
    public void updateRoleByUser(String username, String role) {
        String sql = "UPDATE users_roles "
                + "SET users_roles.role = (SELECT role.id FROM role WHERE role.name = ?) "
                + "WHERE user = (SELECT users.id FROM users WHERE users.username = ?)";
        jdbcTemplate.update(sql, role, username);
    }

    // láº¥y vá»� role database

    // Truy váº¥n role cá»§a user
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

    // Insert user
    public void saveLogin(User users) {
        String sql = "INSERT INTO users (username, password, display_name, enabled, created_at, created_by) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, users.getUsername(), users.getPassword(), users.getDisplay_name(),
                1, _now, "system");
    }

    // Thêm role cho user
    public void saveRoleForUser(String username) {
        String sql = "INSERT INTO users_roles (user, role) VALUES ((SELECT users.id FROM users WHERE users.username = ?),5)";
        jdbcTemplate.update(sql, username);
    }

    public void saveRoleLogin(String username, String role) {
        String sql = "INSERT INTO users_roles (user, role) VALUES ((SELECT users.id FROM users WHERE users.username = ?), (SELECT role.id FROM role WHERE role.name = ?))";
        jdbcTemplate.update(sql, username, role);
    }

    public String getDisplayById(int id_u) {
        String sql = "SELECT display_name FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(sql,String.class,id_u);
    }

    public void ChangeEnabledOfUser(String name, int enabled) {
        String sql = "UPDATE users SET enabled = ? WHERE username = ?";
        jdbcTemplate.update(sql, enabled,name);
    }

    public void updatePassword(String pass, int id){
        String sql = "UPDATE users SET password = ? WHERE id = ?";
        jdbcTemplate.update(sql, pass, id);
    }
}
