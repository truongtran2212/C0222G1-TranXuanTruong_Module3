package repository.person.employee.impl;

import model.person.employee.Education;
import repository.BaseRepository;
import repository.person.employee.EducationRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepositoryImpl implements EducationRepository {
    private static final String SELECT_ALL = "select * from education_degree;";
    @Override
    public List<Education> findAll() {

        List<Education> educationList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("education_degree_id");
                String name = resultSet.getString("education_degree_name");
                Education education = new Education(id, name);
                educationList.add(education);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationList;
    }
}
