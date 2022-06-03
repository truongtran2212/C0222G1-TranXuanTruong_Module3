package service.customer.impl;

import model.person.Customer;
import repository.person.customer.CustomerRepository;
import repository.person.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    CustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void create(Customer customer) {
        customerRepository.create(customer);
    }

    @Override
    public Customer findById(String idCustomer) {
       return customerRepository.findById(idCustomer);
    }

    @Override
    public void delete(String idCustomer) {
        customerRepository.delete(idCustomer);
    }

    @Override
    public void update(String idCustomer, Customer customer) {
            customerRepository.update(idCustomer, customer);
    }

    @Override
    public List<Customer> search(String customerSearch, String id) {
        return customerRepository.search(customerSearch, id);
    }


}
