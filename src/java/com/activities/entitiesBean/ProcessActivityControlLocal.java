/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entitiesBean;

import com.activities.entities.ProcessActivity;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author ERavhengani
 */
@Local
public interface ProcessActivityControlLocal {

    public void addProcessActivity(ProcessActivity processActivity);

    public void updateProcessActivity(ProcessActivity processActivity);

    public void deleteProcessActivity(String id);

    public List getProcessActivities();




    
}
