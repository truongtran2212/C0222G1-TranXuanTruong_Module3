package service.person.employee;

import model.person.employee.Employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Employee> findAll();
    Map<String, String> create(HttpServletRequest request, HttpServletResponse response);
    void delete (int id);
    Employee findById(int id);
    void update (int id, Employee employee);
    List<Employee> search (String nameSearch, String addressSearch);
}
