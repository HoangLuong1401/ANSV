package ansv.vn.entity;

public class CourseType {

    private int id;
    private String name_tpye;
    private String description_type;

    public CourseType(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_tpye() {
        return name_tpye;
    }

    public void setName_tpye(String name_tpye) {
        this.name_tpye = name_tpye;
    }

    public String getDescription_type() {
        return description_type;
    }

    public void setDescription_type(String description_type) {
        this.description_type = description_type;
    }
}
