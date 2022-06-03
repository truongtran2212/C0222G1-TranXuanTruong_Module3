package repository.person.customer;

import model.person.CustomerType;

import java.util.List;

public interface CustomerTypeRepository {
    List<CustomerType> findAll();
}
