package service.person.employee.impl;

import model.person.employee.Division;
import repository.person.employee.DivisionRepository;
import repository.person.employee.impl.DivisionRepositoryImpl;
import service.person.employee.DivisionService;

import java.util.List;

public class DivisionServiceImpl implements DivisionService {
    DivisionRepository divisionRepo = new DivisionRepositoryImpl();

    @Override
    public List<Division> findAll() {
        return divisionRepo.findAll();
    }
}
