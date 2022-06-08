package repository;

import model.Cinema;

import java.util.List;

public interface CinemaRepo {
    List<Cinema> findAll();

    void create (Cinema cinema);
    void delete (String id);
    Cinema findbyId(String idFind);
}
