package repository;

import model.Division;
import model.Employee;

import java.util.List;

public interface EmployeeRepo {
    Employee findById(int id);

    List<Employee> findAll();

    void save(Employee employee);

    void update(int id);

    void delete(int id);
}
