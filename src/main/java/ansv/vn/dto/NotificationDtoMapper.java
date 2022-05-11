package ansv.vn.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NotificationDtoMapper implements RowMapper<NotificationDto> {
    @Override
    public NotificationDto mapRow(ResultSet rs, int i) throws SQLException {
        NotificationDto notifi = new NotificationDto();

        notifi.setId(rs.getInt("id"));
        notifi.setId_u(rs.getInt("id_u"));
        notifi.setId_notifi(rs.getInt("id_no"));
        notifi.setIsread(rs.getInt("is_read"));

        return notifi;
    }
}
