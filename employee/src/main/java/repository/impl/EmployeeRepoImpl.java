package repository.impl;

import model.Employee;
import repository.EmployeeRepo;
import repository.baserepo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepoImpl implements EmployeeRepo {
    @Override
    public Employee findById(int id) {
        Employee employee = null;
        String findById = "select * from employee where id = ?;";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(findById);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            int idEmployee = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String birthday = resultSet.getString("birthday");
            String idCard = resultSet.getString("id_card");
            double salary = resultSet.getDouble("salary");
            String phone = resultSet.getString("phone");
            String email = resultSet.getString("email");
            String address = resultSet.getString("address");
            int positionId = resultSet.getInt("position_id");
            int educationDegreeId = resultSet.getInt("education_degree_id");
            int divisionId = resultSet.getInt("division_id");
            String userName = resultSet.getString("username");
            int status = resultSet.getInt("status");

            employee = new Employee(idEmployee, name, birthday, idCard, salary, phone, email
                    , address, positionId, educationDegreeId, divisionId, userName, status);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        String selectAll = "select * from employee;";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(selectAll);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                int status = resultSet.getInt("status");

                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email
                        , address, positionId, educationDegreeId, divisionId, userName, status);

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void create(Employee employee) {
        String create = "insert  into employee (`name`, " +
                "birthday, " +
                "id_card, " +
                "salary," +
                " phone," +
                " email," +
                " address," +
                " position_id," +
                " education_degree_id," +
                " division_id," +
                " username) \n" +
                "values (?,?,?,?,?,?,?,?,?,?,?);";

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(create);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationDegreeId());
            ps.setInt(10, employee.getDivisionId());
            ps.setString(11, employee.getUserName());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void update(Employee employee) {
        String update = "update employee set `name` = ?, birthday = ?," +
                "id_card = ?, salary = ?,phone = ?," +
                "email = ?, address = ?, position_id = ?, education_degree_id = ?,division_id=?" +
                " where id = ?;";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(update);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getBirthday());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationDegreeId());
            ps.setInt(10, employee.getDivisionId());
            ps.setInt(11, employee.getId());

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String updateDelete = "update employee set `status` = 1 where  id = ?;";

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(updateDelete);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> search(String nameSearch, String divisionIdSearch) {

        List<Employee> employeeList = new ArrayList<>();
        String search = "select * from employee where `name` like ? and division_id like ?;";
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(search);

            // truyền tham số trước khi execute
            ps.setString(1, "%" + nameSearch + "%");
            ps.setString(2, "%" + divisionIdSearch + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                int status = resultSet.getInt("status");

                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email
                        , address, positionId, educationDegreeId, divisionId, userName, status);

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }
}
