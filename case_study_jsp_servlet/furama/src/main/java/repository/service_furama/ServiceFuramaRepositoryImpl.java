package repository.service_furama;

import model.person.Customer;
import model.service_furama.Service;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceFuramaRepositoryImpl implements ServiceFuramaRepository{

    private static final String SELECT_ALL = "SELECT * from service;";
    private static final String CREATE = "insert into service" +
            "(service_id,service_name, service_area, service_cost, service_max_people, standard_room, " +
            "description_other_convenience, pool_area, number_of_floors," +
            " rent_type_id, service_type_id)" +
            "values (?,?,?,?,?,?,?,?,?,?,?)";

    @Override
    public List<Service> findAll() {

        List<Service> serviceList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                String idService = resultSet.getString("service_id");
                String serviceName = resultSet.getString("service_name");
                int serviceArea = resultSet.getInt("service_area");
                double serviceCost = resultSet.getInt("service_cost");
                int serviceMaxpeople = resultSet.getInt("service_max_people");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int serviceTypeId = resultSet.getInt("service_type_id");
                int status = resultSet.getInt("status");

                Service service = new Service(idService,serviceName,serviceArea,serviceCost,serviceMaxpeople,standardRoom
                        ,descriptionOtherConvenience,poolArea,numberOfFloors,rentTypeId,serviceTypeId,status);
                serviceList.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public void create(Service service) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);

            ps.setString(1,service.getIdService());
            ps.setString(2,service.getServiceName());
            ps.setInt(3,service.getServiceArea());
            ps.setDouble(4,service.getServiceCost());
            ps.setInt(5,service.getServiceMaxpeople());
            ps.setString(6,service.getStandardRoom());
            ps.setString(7,service.getDescriptionOtherConvenience());
            ps.setDouble(8,service.getPoolArea());
            ps.setInt(9,service.getNumberOfFloors());
            ps.setInt(10,service.getRentTypeId());
            ps.setInt(11,service.getServiceTypeId());
            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
