package service;

import model.Cinema;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface CinemaService {
    List<Cinema> findAll();
    Map<String, String> create (HttpServletRequest request, HttpServletResponse response);
    void delete (String id);
    Cinema findbyId(String idFind);
}
