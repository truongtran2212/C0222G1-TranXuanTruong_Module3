package service.impl;

import model.Employee;
import model.User;
import repository.EmployeeRepo;
import repository.UserRepo;
import repository.impl.EmployeeRepoImpl;
import repository.impl.UserRepoImpl;
import service.EmployeeService;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {

    EmployeeRepo employeeRepo = new EmployeeRepoImpl();
    UserRepo userRepo = new UserRepoImpl();

    @Override
    public Employee findById(int id) {
        return employeeRepo.findById(id);
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepo.findAll();
    }

    @Override
    public Map<String, String> create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = new LinkedHashMap<>();
        String name = request.getParameter("name");
        if (name.equals("")) {
            validate.put("name", "Không được để trống");
        }


        String birthday = request.getParameter("birthday");
        if (birthday.equals("")) {
            validate.put("birthday", "Không được để trống");
        }

        String idCard = request.getParameter("idCard");
        if (idCard.equals("")) {
            validate.put("idCard", "Không được để trống");
        }

        double salary = 0;
        try {
            salary = Double.parseDouble(request.getParameter("salary"));
            if (salary < 0) {
                validate.put("salary", "Không được nhập số âm");
            }
        } catch (NumberFormatException e) {
            validate.put("salary", "Không được để trống và phải nhập số");
        }


        String phone = request.getParameter("phone");
        if (phone.equals("")) {
            validate.put("phone", "Không được để trống");
        }


        String email = request.getParameter("email");
        if (email.equals("")) {
            validate.put("email", "Không được để trống");
        }


        String address = request.getParameter("address");
        if (address.equals("")) {
            validate.put("address", "Không được để trống");
        }


        int positionId = 0;
        try {
            positionId = Integer.parseInt(request.getParameter("positionId"));
            if (positionId < 0) {
                validate.put("positionId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("positionId", "Không được để trống và phải nhập số");
        }


        int educationDegreeId = 0;
        try {
            educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
            if (educationDegreeId < 0) {
                validate.put("educationDegreeId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("educationDegreeId", "Không được để trống và phải nhập số");
        }


        int divisionId = 0;
        try {
            divisionId = Integer.parseInt(request.getParameter("divisionId"));
            if (divisionId < 0) {
                validate.put("divisionId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("divisionId", "Không được để trống và phải nhập số");
        }


        String userName = request.getParameter("userName");
        if (userName.equals("")) {
            validate.put("userName", "Không được để trống");
        }


        String password = request.getParameter("password");

        if (password.equals("")) {
            validate.put("password", "Không được để trống");
        }
        if (validate.isEmpty()) {
            User user = new User(userName, password);
            Employee employee = new Employee(name, birthday, idCard, salary,
                    phone, email, address, positionId, educationDegreeId, divisionId, userName);

            userRepo.create(user);
            employeeRepo.create(employee);
        }
        return validate;
    }

    @Override
    public Map<String, String> update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = new LinkedHashMap<>();

        String name = request.getParameter("name");

        if (name.equals("")) {
            validate.put("name", "Không được để trống");
        }


        String birthday = request.getParameter("birthday");
        if (birthday.equals("")) {
            validate.put("birthday", "Không được để trống");
        }

        String idCard = request.getParameter("idCard");
        if (idCard.equals("")) {
            validate.put("idCard", "Không được để trống");
        }

        double salary = 0;
        try {
            salary = Double.parseDouble(request.getParameter("salary"));
            if (salary < 0) {
                validate.put("salary", "Không được nhập số âm");
            }
        } catch (NumberFormatException e) {
            validate.put("salary", "Không được để trống và phải nhập số");
        }


        String phone = request.getParameter("phone");
        if (phone.equals("")) {
            validate.put("phone", "Không được để trống");
        }


        String email = request.getParameter("email");
        if (email.equals("")) {
            validate.put("email", "Không được để trống");
        }


        String address = request.getParameter("address");
        if (address.equals("")) {
            validate.put("address", "Không được để trống");
        }


        int positionId = 0;
        try {
            positionId = Integer.parseInt(request.getParameter("positionId"));
            if (positionId < 0) {
                validate.put("positionId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("positionId", "Không được để trống và phải nhập số");
        }


        int educationDegreeId = 0;
        try {
            educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
            if (educationDegreeId < 0) {
                validate.put("educationDegreeId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("educationDegreeId", "Không được để trống và phải nhập số");
        }


        int divisionId = 0;
        try {
            divisionId = Integer.parseInt(request.getParameter("divisionId"));
            if (divisionId < 0) {
                validate.put("divisionId", "Không được nhập số âm");
            }
        } catch (NumberFormatException o) {
            validate.put("divisionId", "Không được để trống và phải nhập số");
        }


        String userName = request.getParameter("userName");

        int id = Integer.parseInt(request.getParameter("id"));

        if (validate.isEmpty()) {
            Employee employee = new Employee(id, name, birthday, idCard, salary,
                    phone, email, address, positionId, educationDegreeId, divisionId, userName);

            employeeRepo.update(employee);
        }
        return validate;
    }

    @Override
    public void delete(int id) {
        employeeRepo.delete(id);
    }

    @Override
    public List<Employee> search(String nameSearch, String divisionIdSearch) {
        return employeeRepo.search(nameSearch, divisionIdSearch);
    }
}
