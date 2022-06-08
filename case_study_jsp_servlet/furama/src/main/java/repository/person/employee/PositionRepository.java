package repository.person.employee;

import model.person.employee.Position;

import java.util.List;

public interface PositionRepository {
    List<Position> findAll();
}
