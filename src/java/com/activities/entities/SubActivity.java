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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ERavhengani
 */
@Entity
@Table(name = "sub_activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SubActivity.findAll", query = "SELECT s FROM SubActivity s"),
    @NamedQuery(name = "SubActivity.findBySubActivityId", query = "SELECT s FROM SubActivity s WHERE s.subActivityId = :subActivityId"),
    @NamedQuery(name = "SubActivity.findBySubActivityName", query = "SELECT s FROM SubActivity s WHERE s.subActivityName = :subActivityName"),
    @NamedQuery(name = "SubActivity.findByIssues", query = "SELECT s FROM SubActivity s WHERE s.issues = :issues"),
    @NamedQuery(name = "SubActivity.findBySolutions", query = "SELECT s FROM SubActivity s WHERE s.solutions = :solutions")})
public class SubActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sub_activity_id")
    private Integer subActivityId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "sub_activity_name")
    private String subActivityName;
    @Size(max = 2000)
    @Column(name = "issues")
    private String issues;
    @Size(max = 2000)
    @Column(name = "solutions")
    private String solutions;
    @JoinColumn(name = "process_activity_name", referencedColumnName = "process_activity_name")
    @ManyToOne(optional = false)
    private ProcessActivity processActivityName;
    @JoinColumn(name = "focus_area_name", referencedColumnName = "focus_area_name")
    @ManyToOne
    private FocusArea focusAreaName;

    public SubActivity() {
    }

    public SubActivity(Integer subActivityId) {
        this.subActivityId = subActivityId;
    }

    public SubActivity(Integer subActivityId, String subActivityName) {
        this.subActivityId = subActivityId;
        this.subActivityName = subActivityName;
    }

    public Integer getSubActivityId() {
        return subActivityId;
    }

    public void setSubActivityId(Integer subActivityId) {
        this.subActivityId = subActivityId;
    }

    public String getSubActivityName() {
        return subActivityName;
    }

    public void setSubActivityName(String subActivityName) {
        this.subActivityName = subActivityName;
    }

    public String getIssues() {
        return issues;
    }

    public void setIssues(String issues) {
        this.issues = issues;
    }

    public String getSolutions() {
        return solutions;
    }

    public void setSolutions(String solutions) {
        this.solutions = solutions;
    }

    public ProcessActivity getProcessActivityName() {
        return processActivityName;
    }

    public void setProcessActivityName(ProcessActivity processActivityName) {
        this.processActivityName = processActivityName;
    }

    public FocusArea getFocusAreaName() {
        return focusAreaName;
    }

    public void setFocusAreaName(FocusArea focusAreaName) {
        this.focusAreaName = focusAreaName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (subActivityId != null ? subActivityId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SubActivity)) {
            return false;
        }
        SubActivity other = (SubActivity) object;
        if ((this.subActivityId == null && other.subActivityId != null) || (this.subActivityId != null && !this.subActivityId.equals(other.subActivityId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.SubActivity[ subActivityId=" + subActivityId + " ]";
    }
    
}
