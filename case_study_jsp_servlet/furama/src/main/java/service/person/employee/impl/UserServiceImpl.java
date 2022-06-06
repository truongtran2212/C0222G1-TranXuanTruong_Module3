package service.person.employee.impl;

import model.person.employee.User;
import repository.person.employee.UserRepository;
import repository.person.employee.impl.UserRepositoryImpl;
import service.person.employee.UserService;

public class UserServiceImpl implements UserService {

    UserRepository userRepository = new UserRepositoryImpl();
    @Override
    public void create(User user) {
        userRepository.create(user);
    }
}
