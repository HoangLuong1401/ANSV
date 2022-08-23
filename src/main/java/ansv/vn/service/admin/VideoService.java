package ansv.vn.service.admin;

import ansv.vn.dao.CommentDao;
import ansv.vn.dao.VideoDao;
import ansv.vn.dto.Comments;
import ansv.vn.dto.Vote;
import ansv.vn.entity.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoService {

    @Autowired
    private VideoDao videoDao;

    @Autowired
    private CommentDao commentDao;

    public List<Video> getAllVideoByIdCourse(int id){
        return videoDao.getAllVideoByIdCourse(id);
    }

    public Video getFirtsVideo(int id){
        return videoDao.getFirstVieoOfCourse(id);
    }

    public Video getVideoByUrl(String url){
        return videoDao.getVideoByUrl(url);
    }

    public void InsertVideoByCourseId(Video video){ videoDao.insertVideoByIdCourse(video); }

    public void deleteVideoById(int id){ videoDao.deleteAVideo(id); }

    public void deleteVideoByIdCourse(int id){
        videoDao.deleteByIdCourse(id);
    }

    public List<Comments> getCommandOfAVideo(int id){
        return commentDao.getCommentOfACourseById(id);
    }

    public void addNewCommandAndVote(Comments v){
        commentDao.addAComment(v);
    }

    public void addNewVote(int id_u, int id_c, int mark){
        videoDao.addNewVote(mark,id_c,id_u);
    }

    public int getNumberVote(int id_c){
        return videoDao.getNumberVote(id_c);
    }

    public int getUserVote(int id_c, int id_u){
        int mark;
        try{
            mark = videoDao.getUserVote(id_c, id_u);
        }catch (Exception e){
            mark = 0;
        }
        return mark;
    }
}
