package ansv.vn.service.admin;

import ansv.vn.dao.NotificationDao;
import ansv.vn.dto.NotificationDto;
import ansv.vn.entity.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService {

    @Autowired
    private NotificationDao notificationDao;
    //Admin
    public List<Notification> getAllDataNotofi(){
        return notificationDao.getAllDataOfNotificationForAdmin();
    }

    public Notification getDataNotificationById(int id){
        return notificationDao.getNotificationById(id);
    }

    public void saveNotificationById(Notification notification){ notificationDao.saveNotification(notification); }

    public void updateNotification(Notification notification){ notificationDao.updateNotification(notification); }

    public void deleteNotificationById(int id){ notificationDao.deleteNotification(id); }

    public void deleteNotificationUserById(int id){ notificationDao.deleteNotificationUser(id); }


    //User
    public List<Notification> getAllDataNotificationCourse(){
        return notificationDao.getAllDataOfNotificationForCourse();
    }

    public List<Integer> getAllIdNotificationCourse(){
        return notificationDao.getAllIdOfNotificationForCourse();
    }

    public List<NotificationDto> getAllDataNotifiOfUser(int id_u){
        return notificationDao.getAllDataOfNotificationForUser(id_u);
    }

    public List<Integer> getAllIdOfNotificationForUser(int id_u){
        return notificationDao.getAllIdOfNotificationForUser(id_u);
    }

    public boolean checkNotificationIsExsit(int id_no, int id_u){
        int row = notificationDao.checkNotificationIsExsit(id_no,id_u);
        if(row != 0){
            return true;
        }
        return false;
    }

    public void saveIsReadNotification(int id_no, int id_u){
        notificationDao.saveIsReadNotification(id_no,id_u);
    }

}
