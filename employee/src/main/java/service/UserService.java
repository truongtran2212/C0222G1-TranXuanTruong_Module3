package service;

import model.Division;
import model.Employee;
import model.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    void create(User user);
}
