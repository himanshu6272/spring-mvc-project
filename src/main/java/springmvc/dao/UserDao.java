package springmvc.dao;

import org.springframework.transaction.annotation.Transactional;
import springmvc.models.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    public int saveUser(User user);

    public List<User> getAll();

    public User getById(int id);

    public void delete(int id);

    public void update(int id);
}
