package ansv.vn.entity;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DocumentMapper implements RowMapper<Document> {
    @Override
    public Document mapRow(ResultSet resultSet, int i) throws SQLException {

        Document doc = new Document();

         doc.setId_doc(resultSet.getInt("id"));
         doc.setName_doc(resultSet.getString("name"));
         doc.setUrl_doc(resultSet.getString("url"));

         return doc;
    }
}
