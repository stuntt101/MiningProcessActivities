/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entitiesBean;

import com.activities.entities.ProcessActivity;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ERavhengani
 */
@Stateless
public class ProcessActivityControl implements ProcessActivityControlLocal {

    @PersistenceContext
    private EntityManager em;
   
      @Override
    public void addProcessActivity(ProcessActivity processActivity) {
        em.persist(processActivity);
    }
    
            @Override
    public void updateProcessActivity(ProcessActivity processActivity) {
        em.merge(processActivity);
    }
    
          @Override
    public void deleteProcessActivity(String id) {
        em.remove(em.find(ProcessActivity.class, id));
    }
    
            @Override
    public List getAllProcessActivities() {
       Query query =  em.createNamedQuery("ProcessActivity.findAll").setMaxResults(100);
       return query.getResultList();  
    }
    
}
