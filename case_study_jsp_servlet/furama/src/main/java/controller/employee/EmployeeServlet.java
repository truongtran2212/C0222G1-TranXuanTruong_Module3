package controller.employee;

import model.person.customer.Customer;
import model.person.customer.CustomerType;
import model.person.employee.*;
import service.person.employee.*;
import service.person.employee.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();
    UserService userService = new UserServiceImpl();
    EducationService educationService = new EducationServiceImpl();
    PositionService positionService = new PositionServiceImpl();
    DivisionService divisionService = new DivisionServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request,response);
                break;
            case "update":
                // chỉnh sửa
                update(request, response);
                break;
            case "delete":

                break;
            case "search":

                break;
            default:
                showEmployeeList(request, response);
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "update":
                // chỉnh sửa
                showFromUpdate(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showEmployeeList(request, response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAll();
        List<Division> divisionList = divisionService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Education> educationList = educationService.findAll();


        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationList", educationList);
        try {
            request.getRequestDispatcher("employee/create-employee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = employeeService.create(request, response);

        if (validate.isEmpty()) {
            String message = "Thêm mới thành công";
            List<Employee> employeeList = employeeService.findAll();
            List<Division> divisionList = divisionService.findAll();
            List<Position> positionList = positionService.findAll();
            List<Education> educationList = educationService.findAll();


            request.setAttribute("employeeList", employeeList);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationList", educationList);
            request.setAttribute("message", message);

            try {
                request.getRequestDispatcher("employee/employee.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            List<Employee> employeeList = employeeService.findAll();
            List<Division> divisionList = divisionService.findAll();
            List<Position> positionList = positionService.findAll();
            List<Education> educationList = educationService.findAll();


            request.setAttribute("employeeList", employeeList);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationList", educationList);
            request.setAttribute("validate", validate);

            try {
                request.getRequestDispatcher("employee/create-employee.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAll();
        List<Division> divisionList = divisionService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Education> educationList = educationService.findAll();


        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationList", educationList);

        try {
            request.getRequestDispatcher("employee/employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);
        List<Employee> employeeList = employeeService.findAll();

        request.setAttribute("employeeList",employeeList);
        try {
            request.getRequestDispatcher("employee/employee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFromUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeService.findById(id);

        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("employee/update-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");

        Employee employee = employeeService.findById(id);

        employee.setName(name);
        employee.setBirthday(birthday);
        employee.setIdCard(idCard);
        employee.setSalary(salary);
        employee.setPhone(phone);
        employee.setEmail(email);
        employee.setAddress(address);
        employee.setPositionId(positionId);
        employee.setEducationDegreeId(educationDegreeId);
        employee.setDivisionId(divisionId);
        employee.setUserName(userName);

        employeeService.update(id, employee);

        request.setAttribute("employee", employee);
        request.setAttribute("mess", "successful update");
        try {
            request.getRequestDispatcher("employee/update-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        List<Employee> employeeList = employeeService.search(name, address);

        request.setAttribute("employeeList", employeeList);

        try {
            request.getRequestDispatcher("employee/employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
