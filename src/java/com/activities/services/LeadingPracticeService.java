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
import com.activities.entities.User;
import com.activities.hibernate.util.HibernateUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
            Query query = session.createQuery("from LeadingPractice where leadingPracticeId ='" + leadingPractice.getLeadingPracticeId() + "'");
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

    public void updateLeadingPractice(LeadingPractice leadingPractice) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.update(leadingPractice);
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

    public void deleteLeadingPractice(Integer leadingPracticeId) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            LeadingPractice leadingPractice = (LeadingPractice) session.load(LeadingPractice.class, new Integer(leadingPracticeId));
            session.delete(leadingPractice);
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

    public LeadingPractice findLeadingPracticeById(Integer leadingPracticeId) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        LeadingPractice leadingPractice = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("FROM LeadingPractice l WHERE l.leadingPracticeId ='" + leadingPracticeId + "'");
            leadingPractice = (LeadingPractice) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadingPractice;
    }

    public List<LeadingPractice> getLeadingPracticeByFocusAreaProcessActivity(FocusArea focusArea, ProcessActivity processActivityName) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.focusAreaName='" + focusArea.getFocusAreaName() + "'and l.processActivityName='" + processActivityName.getProcessActivityName() + "'";

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

    public List<LeadingPractice> getLeadingPracticeByFocusAreaProcessActivitySubActivity(FocusArea focusArea, ProcessActivity processActivityName, SubActivity subActivityName) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.focusAreaName='" + focusArea.getFocusAreaName() + "'and l.processActivityName='" + processActivityName.getProcessActivityName() + "'and s.subActivityName='" + subActivityName.getSubActivityName() + "'";

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

    public Map<String, String> getLeadingPracticeByFocusAreaProcessActivitySubActivity2(FocusArea focusAreaName, ProcessActivity processActivityName, SubActivity subActivityName) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Map<String, String> mapresult = new HashMap<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.focusAreaName='" + focusAreaName.getFocusAreaName() + "'and l.processActivityName='" + processActivityName.getProcessActivityName() + "'and l.subActivityName='" + subActivityName.getSubActivityName() + "'";

        try {

            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery(QUERY).list();
            for (Object obj : list) {
                LeadingPractice leadingPractice = (LeadingPractice) obj;
                mapresult.put(leadingPractice.getIssues(), leadingPractice.getSolutions());
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return mapresult;
    }
    public Map<String, String> getLeadingPracticeByFocusAreaProcessActivitySubActivity3(FocusArea focusAreaName, ProcessActivity processActivityName, SubActivity subActivityName, User addedBy) {

        List<LeadingPractice> list = new ArrayList<LeadingPractice>();
        Map<String, String> mapresult = new HashMap<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        String QUERY = "from LeadingPractice l where l.focusAreaName='" + focusAreaName.getFocusAreaName() + "'and l.processActivityName='" +processActivityName.getProcessActivityName() + "'and l.subActivityName='" + subActivityName.getSubActivityName() + "'and l.addedBy='" +addedBy.getUsername()+"'";

        try {

            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery(QUERY).list();
            for (Object obj : list) {
                LeadingPractice leadingPractice = (LeadingPractice) obj;
                mapresult.put(leadingPractice.getIssues(), leadingPractice.getSolutions());
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return mapresult;
    }

}
