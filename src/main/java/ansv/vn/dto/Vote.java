package ansv.vn.dto;

public class Vote {
    private  int id_user;
    private String username;
    private String date_cmt;
    private String cmt;
    private float marks_vote;

    public Vote() {
    }

    public Vote(int id_user,String cmt,String date_cmt, float marks_vote) {
        this.id_user = id_user;
        this.date_cmt = date_cmt;
        this.marks_vote = marks_vote;
        this.cmt = cmt;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate_cmt() {
        return date_cmt;
    }

    public void setDate_cmt(String date_cmt) {
        this.date_cmt = date_cmt;
    }

    public float getMarks_vote() {
        return marks_vote;
    }

    public void setMarks_vote(float marks_vote) {
        this.marks_vote = marks_vote;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "id_user=" + id_user +
                ", username='" + username + '\'' +
                ", date_cmt='" + date_cmt + '\'' +
                ", marks_vote=" + marks_vote +
                '}';
    }
}
