package com.school.exam.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ss_class")
public class SSClassVO extends IdEntity{
	private String className;
	private String classRemark;
	private List<User> users;
	@OneToMany(mappedBy="ssClass")
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassRemark() {
		return classRemark;
	}
	public void setClassRemark(String classRemark) {
		this.classRemark = classRemark;
	}
	
}
