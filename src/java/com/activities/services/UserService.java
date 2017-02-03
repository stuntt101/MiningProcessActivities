/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.SubActivity;
import com.activities.entities.User;
import com.activities.hibernate.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ERavhengani
 */
public class UserService {
    
        public List<User> getAllusers() {
        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    public boolean isUserExists(User user) {
	Session session = HibernateUtil.getSessionFactory().openSession();
	boolean result = false;
	Transaction tx = null;
	try {
	    tx = session.getTransaction();
	    tx.begin();
	    Query query = session.createQuery("from User where username='" + user.getUsername() + "'");
	    User a_user = (User) query.uniqueResult();
	    tx.commit();
	    if (a_user != null) {
		result = true;
	    }
	} catch (Exception ex) {
	    if (tx != null) {
		tx.rollback();
	    }
	} finally {
	    session.close();
	}
	return result;
    } 
    public boolean addUser(User user) {
	Session session = HibernateUtil.getSessionFactory().openSession();
        if (isUserExists(user)) {
	    return false;
	}
	Transaction tx = null;
	try {
	    tx = session.getTransaction();
	    tx.begin();
	    session.saveOrUpdate(user);
	    tx.commit();
	} catch (Exception e) {
	    if (tx != null) {
		tx.rollback();
	    }
	    e.printStackTrace();
	} finally {
	    session.close();
	}
	return true;
    } 
    
        public User getUserByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where username='"+username+"'");
            user = (User)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
        
        
       public User getUserByEmailAddress(String emailAddress) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where emailAddress='"+emailAddress+"'");
            user = (User)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    } 
       
           public List<User> getUserByRole(Integer role) {

        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from User u where u.role='" + role + "'";

        try {

            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery(QUERY).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }
       
       public void deleteUser(String username) {
	Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            User user = (User) session.load(User.class, new String(username));
            session.delete(user);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }

    }  
      public void updateUser(User user) {
	Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.update(user);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }

    }     
}
