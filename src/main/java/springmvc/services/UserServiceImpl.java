package springmvc.services;

import org.springframework.stereotype.Service;
import springmvc.dao.AddressDao;
import springmvc.dao.UserDao;
import springmvc.models.Address;
import springmvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    @Autowired
    private AddressDao addressDao;
    public int registerUser(User user) {
        List<Address> addresses = user.getAddresses();
        if (addresses != null) {
            for (Address address : addresses) {
                address.setUser(user);
            }
            user.setAddresses(addresses);
        }
        return this.userDao.saveUser(user);
    }

    @Override
    public void updateUser(User user) {
        List<Address> addresses = user.getAddresses();
        if (addresses != null) {
            for (Address address : addresses) {
                address.setUser(user);
            }
            user.setAddresses(addresses);
        }
        this.userDao.update(user);
    }

    @Override
    public List<User> getAllUsers() {
        return this.userDao.getAll();
    }

    @Override
    public User getUserById(int id) {
        return this.userDao.getById(id);
    }

    @Override
    public User getUserByEmail(String email) {
        return this.userDao.getByEmail(email);
    }

    @Override
    public void updateAddress(Address address) {
        this.addressDao.updateAddress(address);
    }

    public List<Address> getUserAddress(int userid)
    {
        List<Address> addresses = this.addressDao.getUserAddress(userid);
        return addresses;
    }

    @Override
    public void deleteAddress(Address address) {
        this.addressDao.deleteAddress(address);
    }

    @Override
    public void deleteUser(User user) {
        this.userDao.delete(user);
    }

    @Override
    public boolean userExist(String email) {
        User user = this.userDao.getByEmail(email);
        if (user == null){
            return false;
        }else {
            return true;
        }

    }

    @Override
    public void updatePassword(String email, String password) {
        this.userDao.updatePassword(email,password);
    }
}
