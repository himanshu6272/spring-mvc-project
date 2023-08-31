package springmvc.services;

import org.springframework.stereotype.Service;
import springmvc.dao.UserDao;
import springmvc.models.Address;
import springmvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    public int registerUser(User user) {
        List<Address> addresses = user.getAddresses();
        for (Address address: addresses){
            address.setUser(user);
        }
        user.setAddresses(addresses);
        return this.userDao.saveUser(user);
    }

    @Override
    public List<User> getAllUsers() {
        return this.userDao.getAll();
    }

    @Override
    public User getUserById(int id) {
        return this.userDao.getById(id);
    }
}
