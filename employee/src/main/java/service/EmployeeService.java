package service;

import model.Division;
import model.Employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
    Employee findById(int id);

    List<Employee> findAll();

    Map<String, String> create(HttpServletRequest request, HttpServletResponse response);

    Map<String, String> update(HttpServletRequest request, HttpServletResponse response);

    void delete(int id);
    List<Employee> search (String nameSearch, String divisionIdSearch);
}
