package ansv.vn.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsDtoMapper implements RowMapper<NewsDto> {
    @Override
    public NewsDto mapRow(ResultSet rs, int i) throws SQLException {

        NewsDto news = new NewsDto();

        news.setId(rs.getInt("id"));
        news.setImg(rs.getString("img"));
        news.setTitle(rs.getString("title"));
        news.setSummary(rs.getString("summary"));
        news.setContent(rs.getString("content"));
        news.setUrl(rs.getString("url"));
        news.setClassify(rs.getString("classify"));
        news.setUpdated_at(rs.getDate("updated_at"));
        news.setUpdated_by(rs.getString("updated_by"));

        return news;
    }
}
