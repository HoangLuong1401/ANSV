package ansv.vn.service.admin;

import ansv.vn.dao.UserDao;
import ansv.vn.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User getByUser(String username) {
        return userDao.getByUser(username);
    }
    public List<User> getAllUser(){
        return userDao.getAllUserForAdmin();
    }

    public String getDisplayById(int id_u){
        return userDao.getDisplayById(id_u);
    }

    public String findRoleByUser(String username){
        return userDao.findRoleByUser(username);
    }
    //
    public int checkUserExist(String username){
        return userDao.checkUserExist(username);
    }

    public int checkUsersRoleExist(String username, String role){
        return userDao.checkUsersRoleExist(username, role);
    }

    public void updateRoleByUser(String username, String role) {
        userDao.updateRoleByUser(username, role);
    }

    public void save(User users) {
        userDao.save(users);
    }

    public void saveLogin(User users) {
        userDao.saveLogin(users);
    }

    public void saveRoleForUser(String username) {
        userDao.saveRoleForUser(username);
    }

    public void saveRoleLogin(String username, String role) {
        userDao.saveRoleLogin(username, role);
    }

    public int count(){
        return userDao.count();
    }

    public void changeEnableOfUser(String name, int enable){
        userDao.ChangeEnabledOfUser(name,enable);
    }

    public void changePassOfUser(int name, String pass){
        userDao.updatePassword(pass, name);
    }

}
