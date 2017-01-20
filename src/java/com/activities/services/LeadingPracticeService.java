/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.FocusArea;
import com.activities.entities.LeadingPractice;
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
public class LeadingPracticeService {

    public List<LeadingPractice> getAllLeadingPractices() {
        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from LeadingPractice").list();
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

    public boolean addLeadingPractice(LeadingPractice leadingPractice) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        if (isLeadingPracticeExists(leadingPractice)) {
            return false;
        }

        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.save(leadingPractice);
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

    public boolean isLeadingPracticeExists(LeadingPractice leadingPractice) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from LeadingPractice where leadingPracticeId='" + leadingPractice.getLeadingPracticeId() + "'");
            LeadingPractice mt = (LeadingPractice) query.uniqueResult();
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

    public List<LeadingPractice> getLeadingPracticeByFocusAreaProcessActivitySubActivity(FocusArea focusAreaName, ProcessActivity processActivityName) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.focusAreaName='" + focusAreaName.getFocusAreaName() + "'and l.processActivityName='" + processActivityName.getProcessActivityName() + "'";

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

   
    public List<LeadingPractice> getLeadingPracticeByProcessActivityName(ProcessActivity processActivityName) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.processActivityName='" + processActivityName.getProcessActivityName() + "'";

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
 
}
