package ansv.vn.service.admin;


import ansv.vn.dao.RoleDao;
import ansv.vn.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    @Autowired
    RoleDao roleDao;

    public List<Role> getAllRole(){
        return roleDao.getAllRole();
    }

    public void updateRole(int id_u, int id_c){
        roleDao.updateRole(id_u,id_c);
    }
}
