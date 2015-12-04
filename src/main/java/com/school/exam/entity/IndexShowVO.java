package com.school.exam.entity;

public class IndexShowVO extends IdEntity{
	private String examName;
	private String personName;
	private Double sumScore;
	private Integer examOrder;
	private Double scale;//及格率
	private Integer personNum;//考试人数
	
	public Integer getPersonNum() {
		return personNum;
	}
	public void setPersonNum(Integer personNum) {
		this.personNum = personNum;
	}
	public Double getScale() {
		return scale;
	}
	public void setScale(Double scale) {
		this.scale = scale;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public Double getSumScore() {
		return sumScore;
	}
	public void setSumScore(Double sumScore) {
		this.sumScore = sumScore;
	}
	public Integer getExamOrder() {
		return examOrder;
	}
	public void setExamOrder(Integer examOrder) {
		this.examOrder = examOrder;
	}
}
