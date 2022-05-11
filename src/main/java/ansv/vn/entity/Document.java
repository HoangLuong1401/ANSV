package ansv.vn.entity;

public class Document {
    private int id_doc;
    private String name_doc;
    private String url_doc;

    public Document() {
    }

    public int getId_doc() {
        return id_doc;
    }

    public void setId_doc(int id_doc) {
        this.id_doc = id_doc;
    }

    public String getName_doc() {
        return name_doc;
    }

    public void setName_doc(String name_doc) {
        this.name_doc = name_doc;
    }

    public String getUrl_doc() {
        return url_doc;
    }

    public void setUrl_doc(String url_doc) {
        this.url_doc = url_doc;
    }
}
