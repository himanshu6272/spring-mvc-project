package springmvc.services;

import org.springframework.stereotype.Component;
import springmvc.models.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    public int registerUser(User user);

    public  List<User> getAllUsers();

    public User getUserById(int id);
}
