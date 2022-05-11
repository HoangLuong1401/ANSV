package ansv.vn.service.admin;

import ansv.vn.dao.DepartmentDao;
import ansv.vn.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentDao deparDao;

    public List<Department> getAllDepartmentForAdmin(){ return deparDao.getAllDepartmentForSepRole();}

    public List<Department> getAllDepartmentForUser(){ return deparDao.getAllDepartmentForUser();}

    public List<Department> getDepartmentForSepRole(){ return deparDao.getDepartmentForSepRole();}

    public List<Department> getDepartmentForUser(){ return deparDao.getDepartmentForUser();}

    public Department getDepartmentById(int id){ return  deparDao.getDepartmentById(id); }

    public void insertDepartment(Department departments){ deparDao.saveDepartment(departments); }

    public void updateDepartment(Department departments){ deparDao.editDepartment(departments); }

    public void deleteDepartment(int id){  deparDao.deleteDepartment(id); }

}
