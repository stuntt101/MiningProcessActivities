/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.Activities;
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
public class ActivitiesService {

    public List<Activities> getAllActivities() {
        List<Activities> list = new ArrayList<Activities>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Activities").list();
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

    public boolean addActivities(Activities activities) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        if (isActivitiesExists(activities)) {
            return false;
        }

        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.save(activities);
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

    public boolean isActivitiesExists(Activities activities) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Activities where activitiesId ='" + activities.getActivitiesId() + "'");
            Activities mt = (Activities) query.uniqueResult();
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

    public List<Activities> getActivitiesByProcessActivity(ProcessActivity processActivityName) {

        List<Activities> list = new ArrayList<Activities>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from Activities a where a.processActivityName='" + processActivityName.getProcessActivityName() + "'";

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
    public List<Activities> getActivitiesBySubActivityName(ProcessActivity processActivityName, SubActivity subActivity) {

        List<Activities> list = new ArrayList<Activities>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from Activities a where a.processActivityName='" + processActivityName.getProcessActivityName() + "'and a.subActivityName='"+subActivity.getSubActivityName()+"'";

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



    public boolean isExisting(ProcessActivity processActivity, SubActivity subActivity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Activities where a.processActivityName='" + processActivity.getProcessActivityName()+ "'and a.subActivityName='"+subActivity.getSubActivityName()+"'");
            Activities mn = (Activities) query.uniqueResult();
            tx.commit();
            if (mn != null) {
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
    } // end method isMineExists
}
