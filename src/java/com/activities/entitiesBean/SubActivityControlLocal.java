/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entitiesBean;

import com.activities.entities.SubActivity;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author ERavhengani
 */
@Local
public interface SubActivityControlLocal {

    public void addSubActivity(SubActivity subActivity);

    public void updateSubActivity(SubActivity subActivity);

    public void deleteSubActivity(String id);

    public List getAllSubActivities();
    
}
