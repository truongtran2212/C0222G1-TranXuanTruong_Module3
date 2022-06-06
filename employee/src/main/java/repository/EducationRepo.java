package repository;

import model.Division;
import model.Education;

import java.util.List;

public interface EducationRepo {
    List<Education> findAll();
}
