package repository.person.employee;

import model.person.employee.Employee;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();

    void create(Employee employee);
    void delete (int id);
    Employee findById(int id);
    void update (int id, Employee employee);
    List<Employee> search (String nameSearch,String addressSearch);

}
