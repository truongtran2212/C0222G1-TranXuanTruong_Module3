package service.person.customer.impl;

import model.person.customer.CustomerType;
import repository.person.customer.CustomerTypeRepository;
import repository.person.customer.impl.CustomerTypeRepositoryImpl;
import service.person.customer.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {

    CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();


    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
