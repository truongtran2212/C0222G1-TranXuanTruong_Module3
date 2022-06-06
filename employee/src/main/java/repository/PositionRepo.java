package repository;

import model.Division;
import model.Position;

import java.util.List;

public interface PositionRepo {
    List<Position> findAll();
}
