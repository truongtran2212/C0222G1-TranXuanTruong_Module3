package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements IUserService{
    IUserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }
}
