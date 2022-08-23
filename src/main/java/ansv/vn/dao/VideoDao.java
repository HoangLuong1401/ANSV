package ansv.vn.dao;

import ansv.vn.dto.Vote;
import ansv.vn.dto.VoteMapper;
import ansv.vn.entity.Video;
import ansv.vn.entity.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Repository
public class VideoDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm:ss");
    final ZonedDateTime now = ZonedDateTime.now();
    final ZonedDateTime dateTime = now.withZoneSameInstant(ZoneId.of("Asia/Ho_Chi_Minh"));


    public List<Video> getAllVideoByIdCourse(int id){
        String sql = "SELECT * FROM videos WHERE id_couses = ?";
        return jdbcTemplate.query(sql,new VideoMapper(),id);
    }

    public void deleteByIdCourse(int id_c){
        String sql = "DELETE FROM videos WHERE id_couses = ?";
        jdbcTemplate.update(sql,id_c);
    }

    public Video getFirstVieoOfCourse(int id){
        String sql = "SELECT * FROM videos WHERE id_couses = ? ORDER BY created_date ASC LIMIT 1;";
        return jdbcTemplate.queryForObject(sql,new VideoMapper(),id);
    }

    public Video getVideoByUrl(String url){
        String sql = "SELECT * FROM videos WHERE urlvideo = ?";
        return jdbcTemplate.queryForObject(sql,new VideoMapper(),url);
    }

    public void insertVideoByIdCourse(Video videos){
        String sql = "INSERT INTO videos (name, urlvideo, id_couses,created_date) VALUES (?,?,?,?)";
        jdbcTemplate.update(sql,videos.getName(),videos.getUrl(),videos.getId_course(), dtf.format(dateTime));
    }

    public void deleteAVideo(int id){
        String sql = "DELETE FROM videos WHERE id = ?";
        jdbcTemplate.update(sql,id);
    }

    //Process vote
    public void addNewVote(int mark, int id_c, int id_u){
        String sql = "UPDATE history SET vote_mark = ? WHERE id_u = ? AND id_c = ?";
        jdbcTemplate.update(sql,mark,id_u, id_c);
    }

    public int getNumberVote(int id_c){
        String sql = "SELECT COUNT(*) FROM history WHERE id_c = ? AND vote_mark != 0";
        return jdbcTemplate.queryForObject(sql, Integer.class, id_c);
    }

    public int getUserVote(int id_c, int id_u){
        String sql = "SELECT vote_mark FROM history WHERE id_c = ? AND id_u = ? AND vote_mark != 0";
        return jdbcTemplate.queryForObject(sql, Integer.class, id_c, id_u);
    }

}
