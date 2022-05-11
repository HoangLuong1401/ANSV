package ansv.vn.entity;

import java.util.List;

public class Department {

    private int id;
    private String name;
    private String full_name;
    private String create_date;
    private String create_by;
    private List<Course> courseList;

    public Department() {
    }



    public Department(int id, String name, String full_name, String create_by, String create_date) {
        this.id = id;
        this.name = name;
        this.full_name = full_name;
        this.create_by = create_by;
        this.create_date = create_date;
    }

    public String getCreate_by() {
        return create_by;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }
}
