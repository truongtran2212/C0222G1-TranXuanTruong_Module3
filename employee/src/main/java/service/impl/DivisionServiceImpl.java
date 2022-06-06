package service.impl;

import model.Division;
import repository.DivisionRepo;
import repository.impl.DivisionRepoImpl;
import service.DivisionService;

import java.util.List;

public class DivisionServiceImpl implements DivisionService {

    DivisionRepo divisionRepo = new DivisionRepoImpl();

    @Override
    public List<Division> findAll() {
        return divisionRepo.findAll();
    }
}
