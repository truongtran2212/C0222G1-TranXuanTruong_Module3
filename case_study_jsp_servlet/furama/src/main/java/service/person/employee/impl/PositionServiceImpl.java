package service.person.employee.impl;

import model.person.employee.Position;
import repository.person.employee.PositionRepository;
import repository.person.employee.impl.PositionRepositoryImpl;
import service.person.employee.PositionService;

import java.util.List;

public class PositionServiceImpl implements PositionService {

    PositionRepository positionRepository = new PositionRepositoryImpl();

    @Override
    public List<Position> findAll() {
        return positionRepository.findAll();
    }
}
