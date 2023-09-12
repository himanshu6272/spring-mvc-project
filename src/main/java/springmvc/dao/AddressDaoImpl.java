package springmvc.dao;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import springmvc.models.Address;

import java.util.List;

@Component
public class AddressDaoImpl implements AddressDao{
    private static final Logger log = Logger.getLogger(AddressDaoImpl.class);
    @Autowired
    HibernateTemplate hibernateTemplate;
    @Transactional
    public void updateAddress(Address address) {
        this.hibernateTemplate.update(address);
        log.info("Address updated successfully");
    }

    @Transactional
    public void deleteAddress(Address address) {
        this.hibernateTemplate.delete(address);
    }

    @Transactional
    public List<Address> getUserAddress(int userid) {
        String getUserQuery = "from Address where user_id=?0";
        @SuppressWarnings({ "unchecked", "deprecation" })
        List<Address> list = (List<Address>) hibernateTemplate.find(getUserQuery,userid);
        return list;

    }
}
