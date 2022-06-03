package service.customer.impl;

import model.person.CustomerType;
import repository.person.customer.CustomerTypeRepository;
import repository.person.customer.impl.CustomerTypeRepositoryImpl;
import service.customer.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {

    CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();


    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
