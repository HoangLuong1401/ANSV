package ansv.vn.dto;

public class Comments {
    private int id_u;
    private String username;
    private int id_c;
    private String dayup;
    private String cmt;

    public Comments() {
    }

    public int getId_u() {
        return id_u;
    }

    public void setId_u(int id_u) {
        this.id_u = id_u;
    }

    public int getId_c() {
        return id_c;
    }

    public void setId_c(int id_c) {
        this.id_c = id_c;
    }

    public String getDayup() {
        return dayup;
    }

    public void setDayup(String dayup) {
        this.dayup = dayup;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
