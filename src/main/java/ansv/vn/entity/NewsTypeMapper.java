package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsTypeMapper implements RowMapper<NewsType> {
    public NewsType mapRow(ResultSet rs, int rowNum) throws SQLException {

        NewsType news_type = new NewsType();

        news_type.setId(rs.getInt("id"));
        news_type.setName(rs.getString("name"));
        news_type.setUpdated_at(rs.getDate("updated_at"));
        news_type.setUpdated_by(rs.getString("updated_by"));

        return news_type;

    }
}
