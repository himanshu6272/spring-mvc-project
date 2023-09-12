package springmvc.dao;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import springmvc.models.Address;

import java.util.List;

@Repository
public interface AddressDao {
    public void updateAddress(Address address);

    public void deleteAddress(Address address);

    public List<Address> getUserAddress(int userid);
}
