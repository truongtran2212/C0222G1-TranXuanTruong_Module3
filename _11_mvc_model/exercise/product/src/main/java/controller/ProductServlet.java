package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                break;
            default:
                showProductList(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormCreate(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "search":
                break;
            default:
                showProductList(request, response);

        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Product product = productService.findById(idProduct);

        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("view/product/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void update(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        String nameProduct = request.getParameter("nameProduct");
        int priceProduct = Integer.parseInt(request.getParameter("priceProduct"));
        Product product = productService.findById(idProduct);

        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setIdProduct(idProduct);
            product.setNameProduct(nameProduct);
            product.setPriceProduct(priceProduct);
            productService.update(idProduct, product);
            request.setAttribute("product", product);
            request.setAttribute("mess", "update sucessful");
        }
        try {
            request.getRequestDispatcher("view/product/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        String nameProduct = request.getParameter("nameProduct");
        int priceProduct = Integer.parseInt(request.getParameter("priceProduct"));
        Product product = new Product(idProduct, nameProduct, priceProduct);

        Map<String, String> map = productService.save(product);
        if (map.isEmpty()) {
            request.setAttribute("mess", "successful create");
        } else {
            request.setAttribute("mess", "fail create");
            request.setAttribute("error", map);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Product product = productService.findById(idProduct);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            this.productService.delete(idProduct);
        }
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Product product = productService.findById(idProduct);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/delete.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
