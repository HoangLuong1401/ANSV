package ansv.vn.entity;

public class Course {
    private int id;
    private String name;
    private String description;
    private int id_depenment;
    private int id_type;
    private String url_img;
    private String create_by;
    private String create_date;

    public Course() { }

    public String getCreate_date() {
        return create_date;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public String getCreate_by() {
        return create_by;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    public String getDescription() {
        return description;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getId_depenment() {
        return id_depenment;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setId_depenment(int id_depenment) {
        this.id_depenment = id_depenment;
    }

    public String getUrl_img() {
        return url_img;
    }

    public void setUrl_img(String url_img) {
        this.url_img = url_img;
    }


    @Override
    public String toString() {

        return "Course{" +
                "name='" + name + '\'' +
                '}';
    }
}
