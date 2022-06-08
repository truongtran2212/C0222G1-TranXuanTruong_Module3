package repository;

import model.Film;

import java.util.List;

public interface FilmRepo {
    List<Film> findAll();
}
