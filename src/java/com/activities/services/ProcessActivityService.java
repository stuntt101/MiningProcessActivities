/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
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
public class ProcessActivityService {
    
    public List<ProcessActivity> getAllProcessActivities() {
	List<ProcessActivity> list = new ArrayList<ProcessActivity>();
	Session session = HibernateUtil.getSessionFactory().openSession();
	Transaction tx = null;
	try {
	    tx = session.getTransaction();
	    tx.begin();
	    list = session.createQuery("from ProcessActivity").list();
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
    
      
        public boolean addProcessActivity(ProcessActivity processActivity) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        if (isProcessActivityExists(processActivity)) {
            return false;
        }

        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.save(processActivity);
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
        
             public boolean isProcessActivityExists(ProcessActivity processActivity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from ProcessActivity where processActivityName ='" + processActivity.getProcessActivityName()+ "'");
            ProcessActivity mt = (ProcessActivity) query.uniqueResult();
            tx.commit();
            if (mt != null) {
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
}

