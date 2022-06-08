package model;

public class Cinema {
    private  String id;
    private  int idFilm;
    private  String showDay;
    private  int amountTicket;
    private int status;

    public Cinema(String id, int idFilm, String showDay, int amountTicket, int status) {
        this.id = id;
        this.idFilm = idFilm;
        this.showDay = showDay;
        this.amountTicket = amountTicket;
        this.status = status;
    }

    public Cinema(String id, int idFilm, String showDay, int amountTicket) {
        this.id = id;
        this.idFilm = idFilm;
        this.showDay = showDay;
        this.amountTicket = amountTicket;
    }

    public Cinema(int idFilm, String showDay, int amountTicket) {
        this.idFilm = idFilm;
        this.showDay = showDay;
        this.amountTicket = amountTicket;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public String getShowDay() {
        return showDay;
    }

    public void setShowDay(String showDay) {
        this.showDay = showDay;
    }

    public int getAmountTicket() {
        return amountTicket;
    }

    public void setAmountTicket(int amountTicket) {
        this.amountTicket = amountTicket;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
