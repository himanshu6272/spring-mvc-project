package springmvc.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import springmvc.models.Address;
import springmvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao{
    @Autowired
    private HibernateTemplate hibernateTemplate;

    String query = "from User where email=?0";
    @Transactional
    public int saveUser(User user) {
        return  (int) this.hibernateTemplate.save(user);
    }

    public List<User> getAll() {
        return this.hibernateTemplate.loadAll(User.class);
    }

    public User getById(int id) {
        return this.hibernateTemplate.get(User.class, id);
    }

    @Transactional
    public void delete(User user) {
        this.hibernateTemplate.delete(user);
    }

    @Transactional
    public void update(User user){
        this.hibernateTemplate.update(user);
    }

    @Override
    public User getByEmail(String email) {
        List<User> list = (List<User>) this.hibernateTemplate.find(query, email);
        User user = null;
        if(list!=null && (list.size() > 0))
        {
            user=list.get(0);
        }
        return user;
    }

    @Transactional
    public void updatePassword(String email, String password) {
        String hql = "UPDATE User SET password = :newPassword WHERE email = :email";
        Session session = this.hibernateTemplate.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
                session.createQuery(hql)
                .setParameter("newPassword", password)
                .setParameter("email", email)
                .executeUpdate();
                transaction.commit();
                session.close();
    }


}
