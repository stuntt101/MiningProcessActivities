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
@Table(name = "sub_activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SubActivity.findAll", query = "SELECT s FROM SubActivity s"),
    @NamedQuery(name = "SubActivity.findBySubActivityName", query = "SELECT s FROM SubActivity s WHERE s.subActivityName = :subActivityName")})
public class SubActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "sub_activity_name")
    private String subActivityName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subActivityName")
    private List<LeadingPractice> leadingPracticeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subActivityName")
    private List<Activities> activitiesList;

    public SubActivity() {
    }

    public SubActivity(String subActivityName) {
        this.subActivityName = subActivityName;
    }

    public String getSubActivityName() {
        return subActivityName;
    }

    public void setSubActivityName(String subActivityName) {
        this.subActivityName = subActivityName;
    }

    @XmlTransient
    public List<LeadingPractice> getLeadingPracticeList() {
        return leadingPracticeList;
    }

    public void setLeadingPracticeList(List<LeadingPractice> leadingPracticeList) {
        this.leadingPracticeList = leadingPracticeList;
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
        hash += (subActivityName != null ? subActivityName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SubActivity)) {
            return false;
        }
        SubActivity other = (SubActivity) object;
        if ((this.subActivityName == null && other.subActivityName != null) || (this.subActivityName != null && !this.subActivityName.equals(other.subActivityName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.SubActivity[ subActivityName=" + subActivityName + " ]";
    }
    
}
