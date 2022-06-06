package service.impl;

import model.User;
import repository.UserRepo;
import repository.impl.UserRepoImpl;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    UserRepo userRepo = new UserRepoImpl();

    @Override
    public List<User> findAll() {
        return userRepo.findAll();
    }
}
