package service.impl;

import model.Cinema;
import repository.CinemaRepo;
import repository.FilmRepo;
import repository.impl.CinemaRepoImpl;
import service.CinemaService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CinemaServiceImpl implements CinemaService {
    CinemaRepo cinemaRepo = new CinemaRepoImpl();


    private static final String ID = "^CI-[0-9]{4}$";

    @Override
    public List<Cinema> findAll() {
        return cinemaRepo.findAll();
    }


    @Override
    public Cinema findbyId(String id) {
        return cinemaRepo.findbyId(id);
    }

    @Override
    public Map<String, String> create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = new LinkedHashMap<>();


        String id = request.getParameter("id");
        if (!id.matches(ID)) {
            validate.put("id", "định dạng CI-XXXX, với X là số nguyên dương");
        }
        if (id.equals("")) {
            validate.put("id", "không được để trống");

        }
        if (findbyId(id) != null) {
            validate.put("id", "Đã trùng id");
        }

        int idFilm = 0;
        try {
            idFilm = Integer.parseInt(request.getParameter("idFilm"));
            if (idFilm < 0) {
                validate.put("idFilm", "phải là số dương");
            }
        } catch (NumberFormatException o) {
            validate.put("idFilm", "không được để trống");
        }

        String showDay = request.getParameter("showDay");

        if (showDay.equals("")) {
            validate.put("showDay", "không được để trống");

        }

        int amountTicket = 0;
        try {
            amountTicket = Integer.parseInt(request.getParameter("amountTicket"));
            if (amountTicket < 0) {
                validate.put("amountTicket", "Phải nhập số dương");
            }
        } catch (NumberFormatException o) {
            validate.put("amountTicket", "Không được để trống và phải nhập chữ");
        }

        if (validate.isEmpty()) {
            Cinema cinema = new Cinema(id,idFilm, showDay, amountTicket);
            cinemaRepo.create(cinema);
        }
        return validate;
    }

    @Override
    public void delete(String id) {
        cinemaRepo.delete(id);
    }


}
