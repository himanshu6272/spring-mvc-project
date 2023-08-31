package springmvc.dao;

import org.springframework.stereotype.Repository;
import springmvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository

public class UserDaoImpl implements UserDao{
    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Transactional
    public int saveUser(User user) {
        return  (int) this.hibernateTemplate.save(user);
    }

    @Override
    public List<User> getAll() {
        return this.hibernateTemplate.loadAll(User.class);
    }

    public User getById(int id) {
        return this.hibernateTemplate.get(User.class, id);
    }

    @Transactional
    public void delete(int id) {
        User user = this.hibernateTemplate.load(User.class, id);
        this.hibernateTemplate.delete(user);
    }

    @Transactional
    public void update(int id){
        User user = this.hibernateTemplate.load(User.class, id);
        this.hibernateTemplate.update(user);
    }


}
