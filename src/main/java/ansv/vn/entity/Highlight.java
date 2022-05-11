package ansv.vn.entity;

import java.sql.Date;

public class Highlight {

    private int id;
    private String img;
    private String header_title;
    private String title;
    private String sub_title;
    private String content;
    private String url;
    private Date updated_at;
    private String updated_by;

    public Highlight() {
    }



    public Highlight(String img, String header_title, String title, String sub_title, String content, String url, Date updated_at, String updated_by) {
        this.img = img;
        this.header_title = header_title;
        this.title = title;
        this.sub_title = sub_title;
        this.content = content;
        this.url = url;
        this.updated_at = updated_at;
        this.updated_by = updated_by;
    }

    public Highlight(int id, String img, String header_title, String title, String sub_title, String content, String url, Date updated_at, String updated_by) {
        this.id = id;
        this.img = img;
        this.header_title = header_title;
        this.title = title;
        this.sub_title = sub_title;
        this.content = content;
        this.url = url;
        this.updated_at = updated_at;
        this.updated_by = updated_by;
    }

    @Override
    public String toString() {
        return "News [id=" + id +
                ", img=" + img +
                ", header_title=" + header_title +
                ", title=" + title +
                ", sub_title=" + sub_title +
                ", content=" + content +
                ", url=" + url +
                ", updated_at=" + updated_at +
                ", updated_by=" + updated_by + "]";
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getHeader_title() {
        return header_title;
    }

    public void setHeader_title(String header_title) {
        this.header_title = header_title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSub_title() {
        return sub_title;
    }

    public void setSub_title(String sub_title) {
        this.sub_title = sub_title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }
}
