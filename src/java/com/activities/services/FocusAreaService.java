/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.FocusArea;
import com.activities.entities.LeadingPractice;
import com.activities.entities.ProcessActivity;
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
public class FocusAreaService {
    
        
    public List<FocusArea> getAllFocusAreas() {
	List<FocusArea> list = new ArrayList<FocusArea>();
	Session session = HibernateUtil.getSessionFactory().openSession();
	Transaction tx = null;
	try {
	    tx = session.getTransaction();
	    tx.begin();
	    list = session.createQuery("from FocusArea").list();
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
   
     public boolean addFocusArea(FocusArea focusArea) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        if (isFocusAreaExists(focusArea)) {
            return false;
        }

        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.save(focusArea);
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

    public boolean isFocusAreaExists(FocusArea focusArea) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from FocusArea where fousAreaName='" + focusArea.getFocusAreaName()+ "'");
            FocusArea mt = (FocusArea) query.uniqueResult();
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
