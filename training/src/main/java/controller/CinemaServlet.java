package controller;

import model.Cinema;
import model.Film;
import service.CinemaService;
import service.FilmService;
import service.impl.CinemaServiceImpl;
import service.impl.FilmServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CinemaServlet", urlPatterns = "/cinema")
public class CinemaServlet extends HttpServlet {

    CinemaService cinemaService = new CinemaServiceImpl();
    FilmService filmService = new FilmServiceImpl();

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
//                update(request, response);

                break;
            case "delete":

                break;
            case "search":
//                search(request, response);
                break;
            default:
                showCinemaList(request, response);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> validate = cinemaService.create(request, response);

        if (validate.isEmpty()) {
            request.setAttribute("message", "Thêm mới thành công");
            List<Cinema> cinemaList = cinemaService.findAll();
            List<Film> filmList = filmService.findAll();

            request.setAttribute("cinemaList", cinemaList);
            request.setAttribute("filmList", filmList);
            try {
                request.getRequestDispatcher("list.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
            List<Cinema> cinemaList = cinemaService.findAll();
            List<Film> filmList = filmService.findAll();
            request.setAttribute("validate", validate);
            request.setAttribute("cinemaList", cinemaList);
            request.setAttribute("filmList", filmList);
            try {
                request.getRequestDispatcher("create.jsp").forward(request, response);
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
//                showFormUpdate(request,response);

                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
//                search(request, response);
                break;
            default:
                showCinemaList(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        cinemaService.delete(id);

        List<Cinema> cinemaList = cinemaService.findAll();

        request.setAttribute("cinemaList", cinemaList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Cinema> cinemaList = cinemaService.findAll();
        List<Film> filmList = filmService.findAll();
        request.setAttribute("filmList", filmList);
        request.setAttribute("cinemaList", cinemaList);
        try {
            request.getRequestDispatcher("create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCinemaList(HttpServletRequest request, HttpServletResponse response) {
        List<Cinema> cinemaList = cinemaService.findAll();
        List<Film> filmList = filmService.findAll();
        request.setAttribute("cinemaList", cinemaList);
        request.setAttribute("filmList", filmList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
