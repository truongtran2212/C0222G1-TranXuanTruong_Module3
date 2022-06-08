package service.person.employee.impl;

import model.person.employee.Education;
import repository.person.employee.EducationRepository;
import repository.person.employee.impl.EducationRepositoryImpl;
import service.person.employee.EducationService;

import java.util.List;

public class EducationServiceImpl implements EducationService {
    EducationRepository educationRepository = new EducationRepositoryImpl();
    @Override
    public List<Education> findAll() {
        return educationRepository.findAll();
    }
}
