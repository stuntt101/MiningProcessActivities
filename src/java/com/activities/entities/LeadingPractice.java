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
@Table(name = "leading_practice")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LeadingPractice.findAll", query = "SELECT l FROM LeadingPractice l"),
    @NamedQuery(name = "LeadingPractice.findByLeadingPracticeId", query = "SELECT l FROM LeadingPractice l WHERE l.leadingPracticeId = :leadingPracticeId"),
    @NamedQuery(name = "LeadingPractice.findByIssues", query = "SELECT l FROM LeadingPractice l WHERE l.issues = :issues"),
    @NamedQuery(name = "LeadingPractice.findBySolutions", query = "SELECT l FROM LeadingPractice l WHERE l.solutions = :solutions")})
public class LeadingPractice implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "leading_practice_id")
    private Integer leadingPracticeId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "issues")
    private String issues;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "solutions")
    private String solutions;
    @JoinColumn(name = "added_by", referencedColumnName = "username")
    @ManyToOne
    private User addedBy;
    @JoinColumn(name = "sub_activity_name", referencedColumnName = "sub_activity_name")
    @ManyToOne(optional = false)
    private SubActivity subActivityName;
    @JoinColumn(name = "process_activity_name", referencedColumnName = "process_activity_name")
    @ManyToOne(optional = false)
    private ProcessActivity processActivityName;
    @JoinColumn(name = "focus_area_name", referencedColumnName = "focus_area_name")
    @ManyToOne(optional = false)
    private FocusArea focusAreaName;

    public LeadingPractice() {
    }

    public LeadingPractice(Integer leadingPracticeId) {
        this.leadingPracticeId = leadingPracticeId;
    }

    public LeadingPractice(Integer leadingPracticeId, String issues, String solutions) {
        this.leadingPracticeId = leadingPracticeId;
        this.issues = issues;
        this.solutions = solutions;
    }

    public Integer getLeadingPracticeId() {
        return leadingPracticeId;
    }

    public void setLeadingPracticeId(Integer leadingPracticeId) {
        this.leadingPracticeId = leadingPracticeId;
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

    public User getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(User addedBy) {
        this.addedBy = addedBy;
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

    public FocusArea getFocusAreaName() {
        return focusAreaName;
    }

    public void setFocusAreaName(FocusArea focusAreaName) {
        this.focusAreaName = focusAreaName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (leadingPracticeId != null ? leadingPracticeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LeadingPractice)) {
            return false;
        }
        LeadingPractice other = (LeadingPractice) object;
        if ((this.leadingPracticeId == null && other.leadingPracticeId != null) || (this.leadingPracticeId != null && !this.leadingPracticeId.equals(other.leadingPracticeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.activities.entities.LeadingPractice[ leadingPracticeId=" + leadingPracticeId + " ]";
    }
    
}
