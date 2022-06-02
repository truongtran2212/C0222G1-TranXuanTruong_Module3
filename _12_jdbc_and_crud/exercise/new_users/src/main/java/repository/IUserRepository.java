package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    void delete(int id);
    User findById(int id);
    void create (User user);
    void update( int id, User user);
    List<User> findByCountry(String country);
}
