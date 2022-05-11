package ansv.vn.dao;

import ansv.vn.entity.Document;
import ansv.vn.entity.DocumentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Repository
public class DocumentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm:ss");
    final ZonedDateTime now = ZonedDateTime.now();
    final ZonedDateTime dateTime = now.withZoneSameInstant(ZoneId.of("Asia/Ho_Chi_Minh"));

    public List<Document>getAllDocByIDCourse(int id_c){
        String sql="SELECT * FROM documents WHERE id_course = ? ORDER BY created_date ASC ";
        return jdbcTemplate.query(sql, new DocumentMapper(), id_c);
    }

    public void deleteDocById(int id){
        String sql="DELETE FROM documents WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void deleteDocByCourse(int id_c){
        String sql="DELETE FROM documents WHERE id_course = ?";
        jdbcTemplate.update(sql, id_c);
    }

    public void insertDoc(Document doc,int id_c){
        String sql="INSERT INTO documents (name, url,id_course,created_date) VALUES (?,?,?,?)";
        jdbcTemplate.update(sql, doc.getName_doc(),doc.getUrl_doc(), id_c, dtf.format(dateTime));
    }
}
