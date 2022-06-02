package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public void create(User user) {
        userRepository.create(user);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id, user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }
}
