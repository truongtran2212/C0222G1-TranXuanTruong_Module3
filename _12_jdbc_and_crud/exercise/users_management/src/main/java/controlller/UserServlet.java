package controlller;

import model.User;
import service.IUserService;
import service.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

private IUserService userService = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                // trả về một form thêm mới

                break;
            case "edit":
                // chỉnh sửa
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showUserList(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                // trả về một form thêm mới

                break;
            case "edit":
                // chỉnh sửa
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showUserList(request,response);
        }
    }
    private void showUserList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.findAll();

        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
