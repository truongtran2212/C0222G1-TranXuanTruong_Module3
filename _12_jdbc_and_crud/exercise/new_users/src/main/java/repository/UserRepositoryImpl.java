package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private static final String SELECT_ALL = "SELECT * from users order by `name`;";
    private static final String UPDATE_DELETE = "UPDATE users set `status` = 1 where id = ?;";
    private static final String UPDATE = "update users set `name`= ?, email = ?, country = ? where id = ?;";
    private static final String FIND_BY_NAME = "SELECT * from users where country = ?;";
    private static final String CREATE = "insert INTO users (`name`,email,country) values (?,?,?);";


    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                int status = resultSet.getInt("status");
                User user = new User(id, name, email, country, status);
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_DELETE);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User findById(int id) {
        String selectById = "SELECT * from users where id = ?;";
        Connection connection = BaseRepository.getConnectDB();
        User user = null;
        try {
            PreparedStatement ps = connection.prepareStatement(selectById);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            int status = resultSet.getInt("status");
            user = new User(id, name, email, country, status);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void create(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(int id, User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());

            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = findAll();
        List<User> searchByCountry = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_NAME);
            ps.setString(1, country);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            for (User item : userList) {
                if (item.getCountry().contains(country)) {
                    searchByCountry.add(item);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return searchByCountry;
    }
}
