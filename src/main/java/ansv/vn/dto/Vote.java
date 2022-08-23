package ansv.vn.dto;

public class Vote {
    private  int id_user;
    private String username;
    private float marks_vote;

    public Vote() {
    }

    public Vote(int id_user, float marks_vote) {
        this.id_user = id_user;
        this.marks_vote = marks_vote;
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


    public float getMarks_vote() {
        return marks_vote;
    }

    public void setMarks_vote(float marks_vote) {
        this.marks_vote = marks_vote;
    }

}
