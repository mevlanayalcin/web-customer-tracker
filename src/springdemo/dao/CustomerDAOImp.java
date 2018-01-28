package springdemo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import springdemo.entity.Customer;

import java.util.List;

@Repository
public class CustomerDAOImp implements CustomerDAO
{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers()
    {
        Session currentSession=sessionFactory.getCurrentSession();

        List<Customer> customers=currentSession.createQuery("from Customer order by lastName").getResultList();

        return customers;
    }

    @Override
    public void saveCustomer(Customer theCustomer)
    {
        Session currentSession=sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theCustomer);//Eğer primary key boşsa customer ın insert ,değilse update yapacak
    }

    @Override
    public Customer getCustomer(int theId)
    {
        Session currentSession=sessionFactory.getCurrentSession();
        Customer theCustomer= currentSession.get(Customer.class,theId);
        return theCustomer;
    }

    @Override
    public void deleteStudent(int theId)
    {
        Session currentSession=sessionFactory.getCurrentSession();
        currentSession.createQuery("delete from Customer where id=?").setParameter(0,theId).executeUpdate();
    }
}
