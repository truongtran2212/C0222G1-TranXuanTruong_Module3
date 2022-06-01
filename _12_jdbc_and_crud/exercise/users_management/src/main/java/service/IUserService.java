package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    void delete(int id);
    User findById(int id);
}
