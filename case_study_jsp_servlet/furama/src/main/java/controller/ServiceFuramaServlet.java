package controller;

import model.service_furama.Service;
import service.service_furama.ServiceFuramaService;
import service.service_furama.ServiceFuramaServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceFuramaServlet", urlPatterns = "/service")
public class ServiceFuramaServlet extends HttpServlet {
    ServiceFuramaService furamaService = new ServiceFuramaServiceImpl();

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

                break;
            case "delete":

                break;
            case "search":

                break;
            default:
                showServiceList(request, response);
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

                break;
            case "delete":

                break;
            case "search":

                break;
            default:
                showServiceList(request, response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("service/create-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
//    private String idService;
//    private String serviceName;
//    private int serviceArea;
//    private double serviceCost;
//    private int serviceMaxpeople;
//    private String standardRoom;
//    private String descriptionOtherConvenience;
//    private double poolArea;
//    private int numberOfFloors;
//    private int rentTypeId;
//    private int serviceTypeId;
//    private int status;


    private void create(HttpServletRequest request, HttpServletResponse response) {

        String idService = request.getParameter("idService");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Integer.parseInt(request.getParameter("serviceCost"));
        int serviceMaxpeople = Integer.parseInt(request.getParameter("serviceMaxpeople"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));

        Service service = new Service(idService, serviceName, serviceArea,
                serviceCost, serviceMaxpeople, standardRoom, descriptionOtherConvenience,
                poolArea, numberOfFloors, rentTypeId, serviceTypeId);

        furamaService.create(service);

        request.setAttribute("service", service);
        request.setAttribute("mess", "Successful add new");
        try {
            request.getRequestDispatcher("service/create-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showServiceList(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = furamaService.findAll();

        request.setAttribute("serviceList", serviceList);

        try {
            request.getRequestDispatcher("service/service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
