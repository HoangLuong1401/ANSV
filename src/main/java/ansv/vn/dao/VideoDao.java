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

    //Process comment
    public void addNewCommandAndVote(Vote v, int id_c){
        String sql = "UPDATE history SET vote_mark = ?, vote_cmt = ?, vote_time = ? WHERE id_u = ? AND id_c = ?";
        jdbcTemplate.update(sql,v.getMarks_vote(),v.getCmt(),v.getDate_cmt(),v.getId_user(), id_c);
    }

    public List<Vote> getCommentOfACourse(int id_c){
        String sql = "SELECT id_u, vote_time, vote_mark, vote_cmt FROM history WHERE id_c = ? ORDER BY vote_time DESC";
        return jdbcTemplate.query(sql, new VoteMapper(),id_c);
    }

}
