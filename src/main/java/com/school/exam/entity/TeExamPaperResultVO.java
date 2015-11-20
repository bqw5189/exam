package com.school.exam.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "T_TE_EXAM_PAPER_RESULT")
public class TeExamPaperResultVO extends IdEntity implements Comparable{
	private String examName;
	private Long examId;
	private String examRemark;
	private String personName;
	private Long personId;
	private Double sumScore;
	private Integer examOrder;
	private Long examCode;
	private Integer state;
	
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Long getExamId() {
		return examId;
	}
	public void setExamId(Long examId) {
		this.examId = examId;
	}
	public String getExamRemark() {
		return examRemark;
	}
	public void setExamRemark(String examRemark) {
		this.examRemark = examRemark;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public Long getPersonId() {
		return personId;
	}
	public void setPersonId(Long personId) {
		this.personId = personId;
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
	public Long getExamCode() {
		return examCode;
	}
	public void setExamCode(Long examCode) {
		this.examCode = examCode;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public TeExamPaperResultVO() {
		// TODO Auto-generated constructor stub
	}
	public TeExamPaperResultVO(String examName, Long examId, String examRemark,
			String personName, Long personId, Double sumScore,
			Integer examOrder, Long examCode, Integer state) {
		super();
		this.examName = examName;
		this.examId = examId;
		this.examRemark = examRemark;
		this.personName = personName;
		this.personId = personId;
		this.sumScore = sumScore;
		this.examOrder = examOrder;
		this.examCode = examCode;
		this.state = state;
	}
	@Override
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		if(o instanceof TeExamPaperResultVO){
			TeExamPaperResultVO vo = (TeExamPaperResultVO)o;
			if(vo.getSumScore()>this.getSumScore()){
				return 1;
			}else if(vo.getSumScore()<this.getSumScore()){
				return -1;
			}
		}
		return 0;
	}
}
