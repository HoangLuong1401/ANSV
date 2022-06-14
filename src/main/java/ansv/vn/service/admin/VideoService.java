package ansv.vn.service.admin;

import ansv.vn.dao.VideoDao;
import ansv.vn.dto.Vote;
import ansv.vn.entity.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoService {

    @Autowired
    private VideoDao videoDao;

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

    public List<Vote> getCommandOfAVideo(int id){
        return videoDao.getCommentOfACourse(id);
    }

    public void addNewCommandAndVote(Vote v,int id_c){
        videoDao.addNewCommandAndVote(v,id_c);
    }
}
