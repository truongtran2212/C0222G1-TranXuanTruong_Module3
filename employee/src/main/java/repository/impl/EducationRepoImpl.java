package repository.impl;

import com.sun.corba.se.impl.resolver.SplitLocalResolverImpl;
import model.Division;
import model.Education;
import repository.EducationRepo;
import repository.baserepo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepoImpl implements EducationRepo {


    private static final String SELECT_ALL = "select * from education_degree;";
    @Override
    public List<Education> findAll() {


        List<Education> educationList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Education education = new Education(id, name);
                educationList.add(education);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationList;
    }
}