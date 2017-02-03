/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ERavhengani
 */
@Entity
@Table(name = "activities")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Activities.findAll", query = "SELECT a FROM Activities a"),
    @NamedQuery(name = "Activities.findByActivitiesId", query = "SELECT a FROM Activities a WHERE a.activitiesId = :activitiesId")})
public class Activities implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "activities_id")
    private Integer activitiesId;
    @JoinColumn(name = "sub_activity_name", referencedColumnName = "sub_activity_name")
    @ManyToOne(optional = false)
    private SubActivity subActivityName;
    @JoinColumn(name = "process_activity_name", referencedColumnName = "process_activity_name")
    @ManyToOne(optional = false)
    private ProcessActivity processActivityName;

    public Activities() {
    }

    public Activities(Integer activitiesId) {
        this.activitiesId = activitiesId;
    }

    public Integer getActivitiesId() {
        return activitiesId;
    }

    public void setActivitiesId(Integer activitiesId) {
        this.activitiesId = activitiesId;
    }

    public SubActivity getSubActivityName() {
        return subActivityName;
    }

    public void setSubActivityName(SubActivity subActivityName) {
        this.subActivityName = subActivityName;
    }

    public ProcessActivity getProcessActivityName() {
        return processActivityName;
    }

    public void setProcessActivityName(ProcessActivity processActivityName) {
        this.processActivityName = processActivityName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (activitiesId != null ? activitiesId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Activities)) {
            return false;
        }
        Activities other = (Activities) object;
        if ((this.activitiesId == null && other.activitiesId != null) || (this.activitiesId != null && !this.activitiesId.equals(other.activitiesId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.Activities[ activitiesId=" + activitiesId + " ]";
    }
    
}
