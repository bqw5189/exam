package com.school.exam.entity;

public class StatanalyViewVO extends IdEntity{
	private Double scale;
	private String questionCont;
	private Integer type;
	private Double questionScore;
	private String personName;
	private Integer isOk;//是否答对
	
	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public Integer getIsOk() {
		return isOk;
	}

	public void setIsOk(Integer isOk) {
		this.isOk = isOk;
	}

	public Double getQuestionScore() {
		return questionScore;
	}

	public void setQuestionScore(Double questionScore) {
		this.questionScore = questionScore;
	}

	public StatanalyViewVO() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getQuestionCont() {
		return questionCont;
	}
	public void setQuestionCont(String questionCont) {
		this.questionCont = questionCont;
	}

	public Double getScale() {
		return scale;
	}

	public void setScale(Double scale) {
		this.scale = scale;
	}
	
}
