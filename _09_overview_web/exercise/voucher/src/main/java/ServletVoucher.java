import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletVoucher", urlPatterns = "/voucher")
public class ServletVoucher extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productDescription = request.getParameter("description");
            double listPrice = Double.parseDouble(request.getParameter("price"));
            double discountPercent = Double.parseDouble(request.getParameter("discount"));

            if (listPrice > 0 && discountPercent > 0) {
                double discountAmount = listPrice * discountPercent * 0.01;
                double discountPrice = listPrice - discountAmount;

                request.setAttribute("productDescription", productDescription);
                request.setAttribute("listPrice", listPrice);
                request.setAttribute("discountPercent", discountPercent);
                request.setAttribute("discountAmount", discountAmount);
                request.setAttribute("discountPrice", discountPrice);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("negative.jsp").forward(request, response);
            }
        } catch (NumberFormatException o) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}
