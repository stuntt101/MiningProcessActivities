/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ERavhengani
 */
@Entity
@Table(name = "process_activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProcessActivity.findAll", query = "SELECT p FROM ProcessActivity p"),
    @NamedQuery(name = "ProcessActivity.findByProcessActivityName", query = "SELECT p FROM ProcessActivity p WHERE p.processActivityName = :processActivityName")})
public class ProcessActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "process_activity_name")
    private String processActivityName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "processActivityName")
    private List<LeadingPractice> leadingPracticeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "processActivityName")
    private List<Activities> activitiesList;

    public ProcessActivity() {
    }

    public ProcessActivity(String processActivityName) {
        this.processActivityName = processActivityName;
    }

    public String getProcessActivityName() {
        return processActivityName;
    }

    public void setProcessActivityName(String processActivityName) {
        this.processActivityName = processActivityName;
    }

    @XmlTransient
    public List<Activities> getActivitiesList() {
        return activitiesList;
    }

    public void setActivitiesList(List<Activities> activitiesList) {
        this.activitiesList = activitiesList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (processActivityName != null ? processActivityName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProcessActivity)) {
            return false;
        }
        ProcessActivity other = (ProcessActivity) object;
        if ((this.processActivityName == null && other.processActivityName != null) || (this.processActivityName != null && !this.processActivityName.equals(other.processActivityName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.ProcessActivity[ processActivityName=" + processActivityName + " ]";
    }
    
}
