package service.person.customer;

import model.person.customer.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> findAll();
    Map<String, String> create(HttpServletRequest request, HttpServletResponse response);
    Customer findById(String idCustomer);
    void delete (String idCustomer);
    void update (String idCustomer, Customer customer);
    List<Customer> search( String customerSearch,String id);
}
