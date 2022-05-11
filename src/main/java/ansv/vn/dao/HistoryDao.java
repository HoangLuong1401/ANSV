package ansv.vn.dao;

import ansv.vn.dto.History;
import ansv.vn.dto.HistoryMapper;
import ansv.vn.dto.NotificationDto;
import ansv.vn.dto.NotificationDtoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Repository
public class HistoryDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm:ss");
    final ZonedDateTime now = ZonedDateTime.now();
    final ZonedDateTime dateTime = now.withZoneSameInstant(ZoneId.of("Asia/Ho_Chi_Minh"));

    public void insertNewHistory(int idc, int idu){
    String sql = "INSERT INTO history (id_u,id_c,create_time) VALUES (?,?,?)";
    jdbcTemplate.update(sql,idu,idc, dtf.format(dateTime));
    }

    public void deleteHistory(int idc){
        String sql = "DELETE FROM history WHERE id_c = ?";
        jdbcTemplate.update(sql,idc);
    }

    public int checkHistoryIsExsit(int id_c, int id_u) {
        int row = 0;
        try {
            String sql = "SELECT * FROM history WHERE id_u = ? AND id_c = ?;";
            List<History> list = jdbcTemplate.query(sql, new HistoryMapper(),id_u,id_c);
            row = list.size();
        }catch (Exception e){
            System.out.println(e);
        }
        return row;
    }

    public List<History> getAllHistoryByUserId(int id){
        String sql = "SELECT * FROM history WHERE id_u = ?";
        return jdbcTemplate.query(sql, new HistoryMapper(),id);
    }
}
