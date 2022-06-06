package service.impl;

import model.Employee;
import repository.EmployeeRepo;
import repository.impl.EmployeeRepoImpl;
import service.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

    EmployeeRepo employeeRepo = new EmployeeRepoImpl();

    @Override
    public Employee findById(int id) {
        return null;
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepo.findAll();
    }

    @Override
    public void save(Employee employee) {

    }

    @Override
    public void update(int id) {

    }

    @Override
    public void delete(int id) {
        employeeRepo.delete(id);
    }
}
