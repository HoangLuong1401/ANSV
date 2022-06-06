package ansv.vn.dao;

import ansv.vn.entity.Course;
import ansv.vn.entity.CourseMapper;
import ansv.vn.entity.CourseType;
import ansv.vn.entity.CourseTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class CourseDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDateTime _now = LocalDateTime.now();


    public List<Course> getDataCouseById(int id) {
        String sql = "SELECT * FROM cousera WHERE id_dep = ? LIMIT 3";
        return jdbcTemplate.query(sql, new CourseMapper(),id);
    }

    public List<Course> getAllDataCouseById(int id) {
        String sql = "SELECT * FROM cousera WHERE id_dep = ?";
        return jdbcTemplate.query(sql, new CourseMapper(),id);
    }

    public Course getCourseByName(String name) {
        String sql = "SELECT * FROM cousera WHERE name = ?;";
        return jdbcTemplate.queryForObject(sql, new CourseMapper() ,name);
    }

    public Course getCourseById(int id) {
        String sql = "SELECT * FROM cousera WHERE id= ?;";
        return jdbcTemplate.queryForObject(sql, new CourseMapper() ,id);
    }

    public List<Course> getAllDataCouse() {
        String sql = "SELECT * FROM cousera";
        return jdbcTemplate.query(sql, new CourseMapper());
    }

    public void deleteCoursebByIdDep(int id) {
        String sql = "DELETE FROM cousera WHERE id_dep = ?";
        jdbcTemplate.update(sql,id);
    }

    public List<CourseType> getAllDataTypeCourse() {
        String sql = "SELECT * FROM course_category";
        return jdbcTemplate.query(sql, new CourseTypeMapper());
    }

    public CourseType getADataTypeCourse(int id) {
        String sql = "SELECT * FROM course_category WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new CourseTypeMapper(), id);
    }

    public void insertCourse(Course course,String text){
        String sql = "INSERT INTO cousera (name, contents, id_dep, id_type, img_url, created_date, created_by, search_text) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        jdbcTemplate.update(sql,course.getName(),
                course.getDescription(),
                course.getId_depenment(),
                course.getId_type(),
                course.getUrl_img(),
                _now,
                course.getCreate_by(),
                text);
    }

    public void deleteCoursebByIdCourse(int id) {
        String sql = "DELETE FROM cousera WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void updateCoursebByIdCourse(Course course, String text) {
        String sql = "UPDATE cousera SET name = ?, contents = ?, id_dep = ?, id_type = ?, search_text = ?WHERE id = ?";
        jdbcTemplate.update(sql,course.getName(),
                course.getDescription(),
                course.getId_depenment(),
                course.getId_type(),
                text,
                course.getId());
    }

    //Get number video of type
    public int getNumberUserByCourse(int id) {
        String sql = "SELECT COUNT(id_c) FROM history WHERE id_c = ?;";
        int result = jdbcTemplate.queryForObject(sql, Integer.class ,id);
        return result;
    }


    //Get number video of type
    public int getCourseByTypeId(int id) {
        String sql = "SELECT COUNT(*) FROM cousera WHERE id_type = ?;";
        int result = jdbcTemplate.queryForObject(sql, Integer.class ,id);
        return result;
    }

    //Tim kiem khoa hoc
    public List<Course> searchCourse(String text){
        String sql = "SELECT * FROM cousera WHERE search_text LIKE '%"+text+"%' AND id_dep <> 3 ORDER BY created_date DESC;";
        return jdbcTemplate.query(sql, new CourseMapper());
    }

    //Tim kiem khoa hoc
    public List<Course> searchCourse(){
        String sql = "SELECT * FROM cousera WHERE id_dep <> 3 ORDER BY created_date DESC;";
        return jdbcTemplate.query(sql, new CourseMapper());
    }


    //Tim kiem khoa hoc for Admin
    public List<Course> searchCourseForSepRole(String text){
        String sql = "SELECT * FROM cousera WHERE search_text LIKE '%"+text+"%' ORDER BY created_date DESC;";
        return jdbcTemplate.query(sql, new CourseMapper());
    }


    //Them moi the loai
    public void insertCourseType(CourseType courseType){
        String sql = "INSERT INTO course_category (name, description) VALUES (?, ?);";
        jdbcTemplate.update(sql, courseType.getName_tpye(),
                courseType.getDescription_type());
    }

    //Chinh sua the loai
    public void updateCourseType(CourseType courseType){
        String sql = "UPDATE course_category SET name = ?, description = ? WHERE id = ?;";
        jdbcTemplate.update(sql, courseType.getName_tpye(),
                courseType.getDescription_type(), courseType.getId());
    }

    //Xoa the loai
    public void deleteCourseType(int id) {
        String sql = "DELETE FROM course_category WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
