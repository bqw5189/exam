package com.school.exam.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
@Entity
@Table(name = "T_TE_EXAM_RESULT")
public class TeExamResultVO extends IdEntity {
	private Long personId;
	private Long depdId;//试卷ID
	private Long examQuestionId;//试题ID
	private String chooseQuestionId;//选择试题选项IDs
	private String questionAnswer;//答案IDs
	private String personName;
	private Double questionScore;
	private Integer state;
	
	public TeExamResultVO() {
		// TODO Auto-generated constructor stub
	}
	public TeExamResultVO(long personId, long depdId, long examQuestionId,
			String chooseQuestionId, String questionAnswer, String personName,
			Double questionScore, Integer state) {
		super();
		this.personId = personId;
		this.depdId = depdId;
		this.examQuestionId = examQuestionId;
		this.chooseQuestionId = chooseQuestionId;
		this.questionAnswer = questionAnswer;
		this.personName = personName;
		this.questionScore = questionScore;
		this.state = state;
	}
	public long getPersonId() {
		return personId;
	}
	public void setPersonId(long personId) {
		this.personId = personId;
	}
	public long getDepdId() {
		return depdId;
	}
	public void setDepdId(long depdId) {
		this.depdId = depdId;
	}
	public long getExamQuestionId() {
		return examQuestionId;
	}
	public void setExamQuestionId(long examQuestionId) {
		this.examQuestionId = examQuestionId;
	}
	public String getChooseQuestionId() {
		return chooseQuestionId;
	}
	public void setChooseQuestionId(String chooseQuestionId) {
		this.chooseQuestionId = chooseQuestionId;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public Double getQuestionScore() {
		return questionScore;
	}
	public void setQuestionScore(Double questionScore) {
		this.questionScore = questionScore;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
}
