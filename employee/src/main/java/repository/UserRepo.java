package repository;

import model.Division;
import model.Employee;
import model.User;

import java.util.List;

public interface UserRepo {
    List<User> findAll();
    void create(User user);
}
