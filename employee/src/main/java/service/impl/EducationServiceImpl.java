package service.impl;

import model.Education;
import repository.EducationRepo;
import repository.impl.EducationRepoImpl;
import service.EducationService;

import java.util.List;

public class EducationServiceImpl implements EducationService {

    EducationRepo educationRepo = new EducationRepoImpl();
    @Override
    public List<Education> findAll() {
        return educationRepo.findAll();
    }
}
