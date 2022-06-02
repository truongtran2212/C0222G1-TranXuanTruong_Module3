package repository.person.customer;

import model.person.Customer;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String SELECT_ALL = "SELECT * from customer;";
    private static final String CREATE = "insert into customer" +
            "(customer_id,customer_name, customer_birthday, customer_gender, " +
            "customer_id_card, customer_phone, customer_email, customer_address, customer_type_id) values (?,?,?,?,?,?,?,?,?);";


    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                String idCustomer = resultSet.getString("customer_id");
                String customerName = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                int status = resultSet.getInt("status");
                Customer customer = new Customer(idCustomer,customerName,birthday,gender,idCard,phone
                        ,email,address,customerTypeId,status);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void create(Customer customer) {
         Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);

            ps.setString(1,customer.getIdCustomer());
            ps.setString(2,customer.getCustomerName());
            ps.setString(3,customer.getBirthday());
            ps.setInt(4,customer.getGender());
            ps.setString(5,customer.getIdCard());
            ps.setString(6,customer.getPhone());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            ps.setInt(9,customer.getCustomerTypeId());
            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
