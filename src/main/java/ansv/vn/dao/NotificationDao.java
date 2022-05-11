package ansv.vn.dao;

import ansv.vn.dto.NotificationDto;
import ansv.vn.dto.NotificationDtoMapper;
import ansv.vn.entity.Notification;
import ansv.vn.entity.NotificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class NotificationDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();

    //Admin
    public List<Notification> getAllDataOfNotificationForAdmin() {
        String sql = "SELECT * FROM notification";
        return jdbcTemplate.query(sql, new NotificationMapper());
    }

    public Notification getNotificationById(int id) {
        String sql = "SELECT * FROM notification WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new NotificationMapper(),id);
    }

    public void saveNotification(Notification notification) {
        String sql = "INSERT INTO notification (title, contents, created_date, created_by) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,notification.getTitle(),
                notification.getContent(),
                _now,
                notification.getCreate_by());
    }

    public void deleteNotification(int id) {
        String sql = "DELETE FROM notification WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void deleteNotificationUser(int id) {
        String sql = "DELETE FROM usre_notification WHERE id_no = ?";
        jdbcTemplate.update(sql, id);
    }


    public void updateNotification(Notification notification) {
        String sql = "UPDATE notification SET title = ? ,contents = ? WHERE id = ?";
        jdbcTemplate.update(sql, notification.getTitle(),
                notification.getContent(),
                notification.getId());
    }

    //User
    public List<Notification> getAllDataOfNotificationForCourse() {
        String sql = "SELECT * FROM notification ORDER BY created_date DESC";
        return jdbcTemplate.query(sql, new NotificationMapper());
    }

    public List<Integer> getAllIdOfNotificationForCourse() {
        String sql = "SELECT * FROM notification ORDER BY created_date DESC";
        return jdbcTemplate.query(sql, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("id");
            }
        });
    }

    public List<NotificationDto> getAllDataOfNotificationForUser(int id_u) {
        String sql = "SELECT * FROM usre_notification WHERE id_u = ?";
        return jdbcTemplate.query(sql, new NotificationDtoMapper(), id_u);
    }

    public List<Integer> getAllIdOfNotificationForUser(int id_u) {
        String sql = "SELECT * FROM usre_notification WHERE id_u = ?";
        return jdbcTemplate.query(sql, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("id_no");
            }
        }, id_u);
    }

    public void saveIsReadNotification(int id_no, int id_u) {
        String sql = "INSERT INTO usre_notification (id_u, id_no, is_read) VALUES (?, ?, 1)";
        jdbcTemplate.update(sql, id_u,id_no);
    }

    public int checkNotificationIsExsit(int id_no, int id_u) {
        int row = 0;
        try {
            String sql = "SELECT * FROM usre_notification WHERE id_u = ? AND id_no = ?;";
            List<NotificationDto> list = jdbcTemplate.query(sql, new NotificationDtoMapper(),id_u,id_no);
            row = list.size();
        }catch (Exception e){
            System.out.println(e);
        }
        return row;
    }
}
