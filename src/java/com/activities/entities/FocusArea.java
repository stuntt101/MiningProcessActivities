/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "focus_area")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FocusArea.findAll", query = "SELECT f FROM FocusArea f"),
    @NamedQuery(name = "FocusArea.findByFocusAreaName", query = "SELECT f FROM FocusArea f WHERE f.focusAreaName = :focusAreaName")})
public class FocusArea implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "focus_area_name")
    private String focusAreaName;
    @OneToMany(mappedBy = "focusAreaName")
    private List<SubActivity> subActivityList;

    public FocusArea() {
    }

    public FocusArea(String focusAreaName) {
        this.focusAreaName = focusAreaName;
    }

    public String getFocusAreaName() {
        return focusAreaName;
    }

    public void setFocusAreaName(String focusAreaName) {
        this.focusAreaName = focusAreaName;
    }

    @XmlTransient
    public List<SubActivity> getSubActivityList() {
        return subActivityList;
    }

    public void setSubActivityList(List<SubActivity> subActivityList) {
        this.subActivityList = subActivityList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (focusAreaName != null ? focusAreaName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FocusArea)) {
            return false;
        }
        FocusArea other = (FocusArea) object;
        if ((this.focusAreaName == null && other.focusAreaName != null) || (this.focusAreaName != null && !this.focusAreaName.equals(other.focusAreaName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.FocusArea[ focusAreaName=" + focusAreaName + " ]";
    }
    
}
