package service.customer;

import model.person.CustomerType;

import java.util.List;

public interface CustomerTypeService {
    List<CustomerType> findAll();
}
