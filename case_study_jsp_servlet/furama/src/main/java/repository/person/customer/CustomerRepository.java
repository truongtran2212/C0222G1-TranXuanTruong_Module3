package repository.person.customer;

import model.person.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();
    void create(Customer customer);
    Customer findById(String idCustomer);
    void delete (String idCustomer);
    void update (String idCustomer, Customer customer);
   List<Customer> search( String customerSearch,String id);
}
