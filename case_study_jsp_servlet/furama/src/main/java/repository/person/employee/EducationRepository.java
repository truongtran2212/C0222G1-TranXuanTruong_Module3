package repository.person.employee;

import model.person.employee.Education;

import java.util.List;

public interface EducationRepository {
    List<Education> findAll();
}
