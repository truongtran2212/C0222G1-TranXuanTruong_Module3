package controller;

import model.person.Customer;
import model.person.CustomerType;
import service.customer.CustomerService;
import service.customer.CustomerTypeService;
import service.customer.impl.CustomerServiceImpl;
import service.customer.impl.CustomerTypeServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();
    CustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
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
                showCustomerList(request, response);
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
                showFormUpdate(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showCustomerList(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String id = request.getParameter("id");

        List<Customer> customerList = customerService.search(name, id);
        List<CustomerType> customerTypeList = customerTypeService.findAll();

        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            request.getRequestDispatcher("customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        String idCustomer = request.getParameter("idCustomer");

        Customer customer = customerService.findById(idCustomer);

        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("customer/update-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String idCustomer = request.getParameter("idCustomer");
        customerService.delete(idCustomer);
        List<Customer> customerList = customerService.findAll();

        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("customer/create-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void create(HttpServletRequest request, HttpServletResponse response) {
        String idCustomer = request.getParameter("idCustomer");
        String customerName = request.getParameter("customerName");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = new Customer(idCustomer, customerName, birthday, gender, idCard, phone, email, address, customerTypeId);
        customerService.create(customer);

        request.setAttribute("customer", customer);
        request.setAttribute("mess", "Successful add new");
        try {
            request.getRequestDispatcher("customer/create-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        String idCustomer = request.getParameter("idCustomer");

        String customerName = request.getParameter("customerName");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));


//        Customer customer = new Customer(idCustomer,customerName,birthday,gender,idCard,phone,email,address,customerTypeId);

        Customer customer = customerService.findById(idCustomer);

        customer.setCustomerName(customerName);
        customer.setBirthday(birthday);
        customer.setGender(gender);
        customer.setIdCard(idCard);
        customer.setPhone(phone);
        customer.setEmail(email);
        customer.setAddress(address);
        customer.setCustomerTypeId(customerTypeId);

        customerService.update(idCustomer, customer);

        request.setAttribute("customer", customer);
        request.setAttribute("mess", "successful update");
        try {
            request.getRequestDispatcher("customer/update-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        List<CustomerType> customerTypeList = customerTypeService.findAll();

        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            request.getRequestDispatcher("customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
