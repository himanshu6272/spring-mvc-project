package springmvc.dao;

import org.springframework.transaction.annotation.Transactional;
import springmvc.models.Address;
import springmvc.models.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    public int saveUser(User user);

    public List<User> getAll();

    public User getById(int id);

    public void delete(User user);

    public void update(User user);

    public User getByEmail(String email);

}
