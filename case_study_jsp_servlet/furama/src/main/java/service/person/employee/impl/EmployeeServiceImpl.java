package service.person.employee.impl;

import model.person.employee.Employee;
import model.person.employee.User;
import repository.person.employee.EmployeeRepository;
import repository.person.employee.UserRepository;
import repository.person.employee.impl.EmployeeRepositoryImpl;
import repository.person.employee.impl.UserRepositoryImpl;
import service.person.employee.EmployeeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
    UserRepository userRepository = new UserRepositoryImpl();

    private static final String PHONE = "^(090[0-9]{7})|(091[0-9]{7})|(\\(84\\)\\+90[0-9]{7})|(\\(84\\)\\+91[0-9]{7})$";
    private static final String ID_CARD = "^[0-9]{9}|[0-9]{12}$";
    private static final String EMAIL = "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
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
        if (!idCard.matches(ID_CARD)) {
            validate.put("idCard", "Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)");
        }
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
        if (!phone.matches(PHONE)) {
            validate.put("phone", "Sai dinh dang,Số điện thoại phải đúng định dạng 090xxxxxxx " +
                    "hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx (X là số 0-9)");
        }
        if (phone.equals("")) {
            validate.put("phone", "Không được để trống");
        }


        String email = request.getParameter("email");
        if (email.equals("")) {
            validate.put("email", "Không được để trống");
        }
        if (!email.matches(EMAIL)) {
            validate.put("email", "Định dạng đúng là inputsomething@gmail.com");
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

            userRepository.create(user);
            employeeRepository.create(employee);
        }
        return validate;
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
