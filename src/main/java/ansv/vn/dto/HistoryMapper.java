package ansv.vn.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class HistoryMapper implements RowMapper<History> {
    @Override
    public History mapRow(ResultSet resultSet, int i) throws SQLException {
        History history = new History();

        history.setId(resultSet.getInt("Id"));
        history.setIdc(resultSet.getInt("id_c"));
        history.setIdu(resultSet.getInt("id_u"));
        history.setCreated_time(resultSet.getString("create_time"));

        return history;
    }
}
