package service.impl;

import model.Film;
import repository.FilmRepo;
import repository.impl.FilmRepoImpl;
import service.FilmService;

import java.util.List;

public class FilmServiceImpl implements FilmService {

    FilmRepo filmRepo = new FilmRepoImpl();
    @Override
    public List<Film> findAll() {
        return filmRepo.findAll();
    }
}
