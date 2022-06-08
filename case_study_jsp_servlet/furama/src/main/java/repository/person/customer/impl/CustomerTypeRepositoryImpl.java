package repository.person.customer.impl;

import model.person.customer.CustomerType;
import repository.BaseRepository;
import repository.person.customer.CustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements CustomerTypeRepository {

    private static final String SELECT_ALL = "select * from customer_type;";
    private static final String CREATE = "insert into customer_type values (?,?);";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                // kiểu dữ liệu của DB
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");

                customerTypeList.add(new CustomerType(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public void create(CustomerType customerType) {
        Connection connection  = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            // kiểu dữ liệu của java
            ps.setInt(1,customerType.getId());
            ps.setString(2,customerType.getName());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
