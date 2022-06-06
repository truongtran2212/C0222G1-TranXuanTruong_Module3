package repository;

import model.Division;
import model.User;

import java.util.List;

public interface UserRepo {
    List<User> findAll();
}
