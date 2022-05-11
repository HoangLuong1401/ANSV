package ansv.vn.entity;

import java.sql.Date;

public class SlideShow {

    private int id;
    private String img;
    private String caption;
    private String content;
    private String url;
    private Date updated_at;
    private String updated_by;

    public SlideShow() {
    }

    public SlideShow(String img, String caption, String content, String url) {
        this.img = img;
        this.caption = caption;
        this.content = content;
        this.url = url;
    }

    public SlideShow(int id, String img, String caption, String content, String url) {
        this.id = id;
        this.img = img;
        this.caption = caption;
        this.content = content;
        this.url = url;
    }

    @Override
    public String toString() {
        return "Slideshow [id=" + id + ", img=" + img + ", caption=" + caption + ", content=" + content + ", url=" + url + ", updated_at=" + updated_at + ", updated_by=" + updated_by + "]";
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

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
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
