package ansv.vn.dto;

public class NotificationDto {
    private int id;
    private int id_notifi;
    private int id_u;
    private int isread;

    public NotificationDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_notifi() {
        return id_notifi;
    }

    public void setId_notifi(int id_notifi) {
        this.id_notifi = id_notifi;
    }

    public int getId_u() {
        return id_u;
    }

    public void setId_u(int id_u) {
        this.id_u = id_u;
    }

    public int getIsread() {
        return isread;
    }

    public void setIsread(int isread) {
        this.isread = isread;
    }
}
