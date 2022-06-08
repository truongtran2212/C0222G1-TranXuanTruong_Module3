package repository;

import model.Division;
import model.Employee;

import java.util.List;

public interface EmployeeRepo {
    Employee findById(int id);

    List<Employee> findAll();

    void create(Employee employee);

    void update(Employee employee);

    void delete(int id);

    List<Employee> search (String nameSearch, String divisionIdSearch);
}
