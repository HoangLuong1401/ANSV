package ansv.vn.dao;

import ansv.vn.entity.Department;
import ansv.vn.entity.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class DepartmentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();

    public List<Department> getDepartmentForSepRole() {
        String sql = "SELECT * FROM departments ORDER BY RAND() LIMIT 3";
        return jdbcTemplate.query(sql, new DepartmentMapper());
    }

    public List<Department> getDepartmentForUser() {
        String sql = "SELECT * FROM departments WHERE name <> 'DF' ORDER BY RAND() LIMIT 3;";
        return jdbcTemplate.query(sql, new DepartmentMapper());
    }

    public List<Department> getAllDepartmentForSepRole() {
        String sql = "SELECT * FROM departments ORDER BY id";
        return jdbcTemplate.query(sql, new DepartmentMapper());
    }

    public List<Department> getAllDepartmentForUser() {
        String sql = "SELECT * FROM departments WHERE name <> 'DF' ORDER BY id";
        return jdbcTemplate.query(sql, new DepartmentMapper());
    }
    public Department getDepartmentById(int id) {
        String sql = "SELECT * FROM departments WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new DepartmentMapper(), id);
    }

    //Them ban
    public void saveDepartment(Department department) {
        String sql = "INSERT INTO departments (name, full_name, created_by, created_date) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, department.getName(), department.getFull_name(), department.getCreate_by(), _now);
    }
    //chinh sua
    public void editDepartment(Department department) {
        String sql = "UPDATE departments SET name = ?, full_name = ? WHERE id = ?";
        jdbcTemplate.update(sql, department.getName(), department.getFull_name(), department.getId());
    }
    //xoa ban
    public void deleteDepartment(int id) {
        String sql = "DELETE FROM departments WHERE id = " + id;
        jdbcTemplate.update(sql);
    }


}
