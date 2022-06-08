package repository.impl;

import model.Film;
import repository.BaseRepository;
import repository.FilmRepo;

import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.List;

public class FilmRepoImpl implements FilmRepo {


    @Override
    public List<Film> findAll() {
        List<Film> filmList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        String selectAll = "select * from film";
        try {
            PreparedStatement ps = connection.prepareStatement(selectAll);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Film film = new Film(id,name);
                filmList.add(film);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return filmList;
    }
}
