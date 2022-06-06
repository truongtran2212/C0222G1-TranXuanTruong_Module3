package repository.person.customer.impl;

import model.person.customer.Customer;
import repository.BaseRepository;
import repository.person.customer.CustomerRepository;

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
    private static final String FIND_BY_ID = "SELECT * from customer where customer_id = ?;";
    private static final String UPDATE_DELETE = "UPDATE customer set `status` = 1 where customer_id = ?;";
    private static final String UPDATE = "update customer set customer_name = ?, customer_birthday = ?," +
            "customer_gender = ?, customer_id_card = ?, customer_phone = ?," +
            "customer_email = ?, customer_address = ?, customer_type_id = ?, status = ? where customer_id = ?;";
    private static final String SEARCH = "SELECT * from customer where customer_name like ? and  customer_type_id like ?;";

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
                Customer customer = new Customer(idCustomer, customerName, birthday, gender, idCard, phone
                        , email, address, customerTypeId, status);
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
            ps.setString(1, customer.getIdCustomer());
            ps.setString(2, customer.getCustomerName());
            ps.setString(3, customer.getBirthday());
            ps.setInt(4, customer.getGender());
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhone());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.setInt(9, customer.getCustomerTypeId());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Customer findById(String id) {
        Connection connection = BaseRepository.getConnectDB();
        Customer customer = null;
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
            ps.setString(1, id);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                String customerName = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                int status = resultSet.getInt("status");
                customer = new Customer(id, customerName, birthday, gender, idCard, phone
                        , email, address, customerTypeId, status);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public void delete(String idCustomer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_DELETE);
            ps.setString(1, idCustomer);
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(String idCustomer, Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE);

            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getBirthday());
            ps.setInt(3, customer.getGender());
            ps.setString(4, customer.getIdCard());
            ps.setString(5, customer.getPhone());
            ps.setString(6, customer.getEmail());
            ps.setString(7, customer.getAddress());
            ps.setInt(8, customer.getCustomerTypeId());
            ps.setInt(9, customer.getStatus());
            ps.setString(10, customer.getIdCustomer());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> search( String customerSearch,String id) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH);
            ps.setString(1, "%" +customerSearch+"%" );
            ps.setString(2, "%"+ id +"%");
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
              Customer customer = new Customer(idCustomer, customerName, birthday, gender, idCard, phone
                        , email, address, customerTypeId, status);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
