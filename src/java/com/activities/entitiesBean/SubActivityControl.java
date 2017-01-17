/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entitiesBean;

import com.activities.entities.SubActivity;
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
public class SubActivityControl implements SubActivityControlLocal {

   @PersistenceContext
    private EntityManager em;
   
      @Override
    public void addSubActivity(SubActivity subActivity) {
        em.persist(subActivity);
    }
    
        @Override
    public void updateSubActivity(SubActivity subActivity) {
        em.merge(subActivity);
    }
    
        @Override
    public void deleteSubActivity(String id) {
        em.remove(em.find(SubActivity.class, id));
    }
    
        @Override
    public List getAllSubActivities() {
       Query query =  em.createNamedQuery("SubActivity.findAll").setMaxResults(100);
       return query.getResultList();  
    }


}
