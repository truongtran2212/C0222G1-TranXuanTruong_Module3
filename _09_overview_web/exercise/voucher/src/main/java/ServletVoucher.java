import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletVoucher",urlPatterns = "/voucher")
public class ServletVoucher extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        double listPrice = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));

        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        PrintWriter printWriter = response.getWriter();

        printWriter.println("<html>");

        printWriter.println("<h1>Discount Amount: " + discountAmount + "<h1>");
        printWriter.println("<h1>Discount Price: " + discountPrice + "<h1>");
        printWriter.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
