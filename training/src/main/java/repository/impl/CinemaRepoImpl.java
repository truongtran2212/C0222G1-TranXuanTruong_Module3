package repository.impl;

import model.Cinema;
import repository.BaseRepository;
import repository.CinemaRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CinemaRepoImpl implements CinemaRepo {


    @Override
    public List<Cinema> findAll() {
        List<Cinema> cinemaList = new ArrayList<>();
        String findAll = "SELECT * FROM cinema;";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(findAll);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                int idFilm = resultSet.getInt("id_film");
                String showDay = resultSet.getString("show_day");
                int amountTicket = resultSet.getInt("amount_ticket");
                int status = resultSet.getInt("status");

                Cinema cinema = new Cinema(id, idFilm, showDay, amountTicket, status);
                cinemaList.add(cinema);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cinemaList;
    }

    @Override
    public void create(Cinema cinema) {
        String create = "insert into cinema (id,id_film,show_day,amount_ticket) values (?,?,?,?);";

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(create);
            ps.setString(1, cinema.getId());
            ps.setInt(2, cinema.getIdFilm());
            ps.setString(3, cinema.getShowDay());
            ps.setInt(4, cinema.getAmountTicket());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void delete(String id) {
        String updateDelete = "update cinema set `status` = 1 where id = ?";

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(updateDelete);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public Cinema findbyId(String idFind) {
        String findById = "select * from cinema where id = ?";
        Cinema cinema = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(findById);
            ps.setString(1, idFind);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            String id = resultSet.getString("id");
            int idFilm = resultSet.getInt("id_film");
            String showDay = resultSet.getString("show_day");
            int amountTicket = resultSet.getInt("amount_ticket");
            int status = resultSet.getInt("status");

            cinema = new Cinema(id, idFilm, showDay, amountTicket, status);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cinema;
    }
}
