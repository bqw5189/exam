package com.school.exam.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.common.collect.Lists;
@Entity
@Table(name="t_te_project")
public class TeProjectVO extends IdEntity {
	private String projectName;
	private String remark;
	private TeCourseVO course;
	private List<TeExamQuestionVO> question = Lists.newArrayList();
	
	public TeProjectVO(Long id) {
		this.id = id;
	}
	@OneToMany(mappedBy="project")
	public List<TeExamQuestionVO> getQuestion() {
		return question;
	}
	public void setQuestion(List<TeExamQuestionVO> question) {
		this.question = question;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@ManyToOne
	@JoinColumn(name="depd_id")
	public TeCourseVO getCourse() {
		return course;
	}
	public void setCourse(TeCourseVO course) {
		this.course = course;
	}
	public TeProjectVO() {
		// TODO Auto-generated constructor stub
	}
	public TeProjectVO(String projectName, String remark) {
		super();
		this.projectName = projectName;
		this.remark = remark;
	}
}
