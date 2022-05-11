package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NotificationMapper implements RowMapper<Notification> {
    @Override
    public Notification mapRow(ResultSet rs, int i) throws SQLException {

        Notification notifi = new Notification();

        notifi.setId(rs.getInt("id"));
        notifi.setTitle(rs.getString("title"));
        notifi.setContent(rs.getString("contents"));
        notifi.setCreate_by(rs.getString("created_by"));
        notifi.setCreate_date(rs.getString("created_date"));
        notifi.setIsshow(rs.getInt("ishow"));

        return notifi;
    }
}
