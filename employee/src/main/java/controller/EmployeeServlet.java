package controller;

import model.*;
import service.*;
import service.impl.*;

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
    DivisionService divisionService = new DivisionServiceImpl();
    PositionService positionService = new PositionServiceImpl();


    EducationService educationService = new EducationServiceImpl();
    UserService userService = new UserServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":

                break;
            case "search":
                search(request, response);
                break;
            default:
                showEmployeeList(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = employeeService.update(request, response);

        if (validate.isEmpty()) {
            String message = "Chỉnh sửa thành công";
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
                request.getRequestDispatcher("employee.jsp").forward(request, response);
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
                request.getRequestDispatcher("update-employee.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
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
                request.getRequestDispatcher("employee.jsp").forward(request, response);
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
                request.getRequestDispatcher("create-employee.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "update":
                showFormUpdate(request,response);

                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showEmployeeList(request, response);
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeService.findById(id);

        List<Division> divisionList = divisionService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Education> educationList = educationService.findAll();

        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationList", educationList);
        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("update-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            request.getRequestDispatcher("create-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String divisionIdSearch = request.getParameter("divisionIdSearch");
        String nameSearch = request.getParameter("nameSearch");


        List<Employee> employeeList = employeeService.search(nameSearch, divisionIdSearch);

        List<Division> divisionList = divisionService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Education> educationList = educationService.findAll();


        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationList", educationList);

        try {
            request.getRequestDispatcher("employee.jsp").forward(request, response);
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
        List<Division> divisionList = divisionService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Education> educationList = educationService.findAll();

        String message = "Xóa thành công";

        request.setAttribute("message", message);

        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationList", educationList);

        try {
            request.getRequestDispatcher("employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            request.getRequestDispatcher("employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
