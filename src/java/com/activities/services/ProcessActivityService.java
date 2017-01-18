/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.ProcessActivity;
import com.activities.hibernate.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
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
}
