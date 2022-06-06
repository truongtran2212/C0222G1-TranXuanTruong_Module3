package service.impl;

import model.Position;
import repository.PositionRepo;
import repository.impl.PositionRepoImpl;
import service.PositionService;

import java.util.List;

public class PositionServiceImpl implements PositionService {

    PositionRepo positionRepo = new PositionRepoImpl();

    @Override
    public List<Position> findAll() {
        return positionRepo.findAll();
    }
}
