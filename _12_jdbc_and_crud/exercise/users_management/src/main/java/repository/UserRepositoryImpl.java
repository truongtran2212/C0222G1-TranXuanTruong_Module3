package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private static final String SELECT_ALL ="SELECT * from users ORDER BY `name`;";

    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuộc tính của bảng
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
