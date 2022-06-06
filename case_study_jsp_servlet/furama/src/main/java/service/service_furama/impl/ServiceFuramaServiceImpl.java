package service.service_furama.impl;

import model.service_furama.Service;
import repository.service_furama.ServiceFuramaRepository;
import repository.service_furama.ServiceFuramaRepositoryImpl;
import service.service_furama.ServiceFuramaService;

import java.util.List;

public class ServiceFuramaServiceImpl implements ServiceFuramaService {
    ServiceFuramaRepository furamaRepository = new ServiceFuramaRepositoryImpl();

    @Override
    public List<Service> findAll() {
        return furamaRepository.findAll();
    }

    @Override
    public void create(Service service) {
        furamaRepository.create(service);
    }
}
