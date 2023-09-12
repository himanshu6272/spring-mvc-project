package springmvc.services;

import org.springframework.stereotype.Component;
import springmvc.models.Address;
import springmvc.models.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    public int registerUser(User user);

    public void updateUser(User user);

    public  List<User> getAllUsers();

    public User getUserById(int id);
    public User getUserByEmail(String email);

    public void updateAddress(Address address);

    public List<Address> getUserAddress(int id);

    public void deleteAddress(Address address);

    void deleteUser(User user);
}
