package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controller.ServletCustomer", urlPatterns = "/customer")
public class ServletCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer[] customers = new Customer[5];
        customers[0] = new Customer("Mai Văn Hoàn", "20-08-1983", "Hà Nội", "https://sport5.mediacdn.vn/thumb_w/700/158855217956261888/2021/5/10/1-16206598558011414763678.jpeg");
        customers[1] = new Customer("Nguyễn Văn An", "21-08-1983", "Bắc Giang", "https://icdn.dantri.com.vn/thumb_w/640/2020/04/06/414913-fd-8-bc-3-e-921700-dea-77-dca-764300612041-a-2885-ce-9-cab-69-dbc-7-df-2866426-fa-7-ad-1586173002247.jpg");
        customers[2] = new Customer("Nguyễn Thái Hòa", "22-08-1983", "Nam Định", "https://media.vov.vn/sites/default/files/styles/large/public/2021-11/dbruyne.jpeg");
        customers[3] = new Customer("Trần Đăng Khoa", "17-08-1983", "Hà Tây", "https://static.bongda24h.vn/medias/standard/2019/1/31/Bong-da-chau-Au-8-cau-thu-nhan-luong-khung-nhung-gay-that-vong-hinh-anh.jpg");
        customers[4] = new Customer("Nguyễn Đình Thi", "19-08-1983", "Hà Nội", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtaDA4bBHKRNyf2LpFek50Jf8l5vXLJzcNgA&usqp=CAU");

        request.setAttribute("customerList", customers);
        request.getRequestDispatcher("customer_list.jsp").forward(request, response);
    }
}

