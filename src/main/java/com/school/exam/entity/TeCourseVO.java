package com.school.exam.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.common.collect.Lists;
@Entity
@Table(name="t_te_course")
public class TeCourseVO extends IdEntity {
	private String courseName;
	private String remark;
	private List<TeProjectVO> project = Lists.newArrayList();
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@OneToMany(mappedBy="course")
	public List<TeProjectVO> getProject() {
		return project;
	}
	public void setProject(List<TeProjectVO> project) {
		this.project = project;
	}
	public TeCourseVO() {
		// TODO Auto-generated constructor stub
	}
	public TeCourseVO(String courseName, String remark) {
		super();
		this.courseName = courseName;
		this.remark = remark;
	}
}