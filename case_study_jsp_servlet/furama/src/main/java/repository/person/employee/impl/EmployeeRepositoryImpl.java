package repository.person.employee.impl;

import model.person.customer.Customer;
import model.person.employee.Employee;
import repository.BaseRepository;
import repository.person.employee.EmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {

    private static final String SELECT_ALL = "select * from employee;";
    private static final String CREATE = "insert into employee\n" +
            "(employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, " +
            "employee_email, employee_address, position_id, education_degree_id, division_id,username) " +
            "values (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_DELETE = "UPDATE employee set `status` = 1 where employee_id = ?;";
    private static final String FIND_BY_ID = "select * from employee where employee_id = ?;";
    private static final String UPDATE = "update employee set employee_name = ?, employee_birthday = ?," +
            "employee_id_card = ?, employee_salary = ?, employee_phone = ?," +
            "employee_email = ?, employee_address = ?, position_id = ?, education_degree_id = ?,division_id=?, username= ?" +
            " where employee_id = ?;";
    private static final String SEARCH = "SELECT * from employee where employee_name like ? and employee_address like ?;";

    @Override
    public List<Employee> findAll() {

        List<Employee> employeeList = new ArrayList<>();

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int idEmployee = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address =resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                int status = resultSet.getInt("status");

                Employee employee = new Employee(idEmployee,name,birthday,idCard,salary,phone,email
                        ,address,positionId,educationDegreeId,divisionId,userName, status);

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void create(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getBirthday());
            ps.setString(3,employee.getIdCard());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhone());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getEducationDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11,employee.getUserName());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

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
    public Employee findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Employee employee = null;
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
            ps.setInt(1,id);

            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int idEmployee = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address =resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                int status = resultSet.getInt("status");

               employee = new Employee(idEmployee,name,birthday,idCard,salary,phone,email
                        ,address,positionId,educationDegreeId,divisionId,userName, status);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public void update(int id, Employee employee) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE);

            ps.setString(1,employee.getName());
            ps.setString(2,employee.getBirthday());
            ps.setString(3,employee.getIdCard());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhone());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getEducationDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11,employee.getUserName());
            ps.setInt(12,id);

            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    ////    private int idEmployee;
////    private String name;
////    private String birthday;
////    private String id_card;
////    private double salary;
////    private String phone;
////    private String email;
////    private String address;
////    private int positionId;
////    private int educationDegreeId;
////    private int divisionId;
////    private String userName;
//

    @Override
    public List<Employee> search(String nameSearch, String addressSearch) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH);
            ps.setString(1, "%"+nameSearch+"%" );
            ps.setString(2, "%"+ addressSearch +"%");
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int idEmployee = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                int status = resultSet.getInt("status");
                Employee employee = new Employee(idEmployee, name, birthday, idCard, salary, phone
                        , email, address, positionId, educationDegreeId,divisionId,userName,status);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }
}
