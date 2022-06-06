package repository.person.employee.impl;

import model.person.employee.User;
import repository.BaseRepository;
import repository.person.employee.UserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRepositoryImpl implements UserRepository {

    private static final String CREATE = "insert into `user` values ( ?,?);";

    @Override
    public void create(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getPassword());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
