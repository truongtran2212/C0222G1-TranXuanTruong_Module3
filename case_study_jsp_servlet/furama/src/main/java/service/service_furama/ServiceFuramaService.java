package service.service_furama;

import model.service_furama.Service;

import java.util.List;

public interface ServiceFuramaService {
    List<Service> findAll();
    void create(Service service);
}
