package repository.person.employee;

import model.person.employee.Division;

import java.util.List;

public interface DivisionRepository {
    List<Division> findAll();
}
