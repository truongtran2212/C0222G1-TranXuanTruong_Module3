package service.service_furama;

import model.person.Customer;
import model.service_furama.Service;
import repository.service_furama.ServiceFuramaRepository;
import repository.service_furama.ServiceFuramaRepositoryImpl;

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
