package services;

import dataaccess.UserDB;
import java.util.List;
import models.User;

public class UserService {

    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public void insert(String email, Boolean active, String first_name, String last_name, String password, int role) throws Exception {
        User user = new User(email, active, first_name, last_name, password, role);
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }

    public void update(String email, Boolean active, String first_name, String last_name, String password, int role) throws Exception {
        User user = new User(email, active, first_name, last_name, password, role);
        UserDB userDB = new UserDB();
        userDB.update(user);
    }

    public void delete(String email) throws Exception {
        User user = new User();
        user.setEmail(email);
        UserDB userDB = new UserDB();
        userDB.delete(user);
    }

}
