package com.school.exam.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

@Entity
@Table(name = "t_te_exam_question")
public class TeExamQuestionVO extends IdEntity  implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer type;
	private String questionCont;
	private String questionAnswerId;
	private Double questionScore;
	private List<TeSelectItemsVO> selectItems = Lists.newArrayList();//试题选项
	private String typeRemark;//页面显示用单选多选说明
	private String checked;//页面显示是否选中
	private TeProjectVO project;
	private Integer state;//0为试题不用1为试题可用
	@ManyToOne
	@JoinColumn(name="project_id")
	@JsonIgnore
	public TeProjectVO getProject() {
		return project;
	}
	
	public void setProject(TeProjectVO project) {
		this.project = project;
	}
	// 一对多定义
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "question",orphanRemoval=true)
	@JsonIgnore
	public List<TeSelectItemsVO> getSelectItems() {
		return selectItems;
	}
	
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public TeExamQuestionVO(Long id) {
		this.id=id;
	}
	/**
	 * 增加选项信息
	 * @param itemsvo
	 */
	public void addSelectItem(TeSelectItemsVO itemsvo){
		itemsvo.setQuestion(this);
		this.selectItems.add(itemsvo);
	}
	public TeExamQuestionVO() {
		// TODO Auto-generated constructor stub
	}
	@Transient
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	@Transient
	public String getTypeRemark() {
		return typeRemark;
	}
	public void setTypeRemark(String typeRemark) {
		this.typeRemark = typeRemark;
	}

	public Double getQuestionScore() {
		return questionScore;
	}

	public void setQuestionScore(Double questionScore) {
		this.questionScore = questionScore;
	}

	public void setSelectItems(List<TeSelectItemsVO> selectItems) {
		this.selectItems = selectItems;
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
	public String getQuestionAnswerId() {
		return questionAnswerId;
	}
	public void setQuestionAnswerId(String questionAnswerId) {
		this.questionAnswerId = questionAnswerId;
	}
}
