package service.person.employee.impl;

import model.person.employee.Employee;
import repository.person.employee.EmployeeRepository;
import repository.person.employee.impl.EmployeeRepositoryImpl;
import service.person.employee.EmployeeService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
        EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public void create(Employee employee) {
        employeeRepository.create(employee);

    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public void update(int id, Employee employee) {
        employeeRepository.update(id, employee);
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch) {
        return employeeRepository.search(nameSearch, addressSearch);
    }
}
