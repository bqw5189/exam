package com.school.exam.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_te_question_exampaper")
public class TeQuestionExamVO extends IdEntity {
	private Long exampaperId;
	private Long questionId;
	//private Integer no;
	
	public TeQuestionExamVO() {
		// TODO Auto-generated constructor stub
	}
	public TeQuestionExamVO(long exampaperId, long questionId) {
		super();
		this.exampaperId = exampaperId;
		this.questionId = questionId;
	}

	public Long getExampaperId() {
		return exampaperId;
	}
	public void setExampaperId(Long exampaperId) {
		this.exampaperId = exampaperId;
	}
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
}
