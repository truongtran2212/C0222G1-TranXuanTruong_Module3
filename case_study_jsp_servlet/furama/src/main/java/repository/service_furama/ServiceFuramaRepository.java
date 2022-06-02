package repository.service_furama;

import model.person.Customer;
import model.service_furama.Service;

import java.util.List;

public interface ServiceFuramaRepository {
    List<Service> findAll();
    void create(Service service);
}
