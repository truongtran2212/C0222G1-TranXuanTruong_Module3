package repository.person.customer;

import model.person.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();
    void create(Customer customer);
}
