package com.school.exam.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.school.exam.entity.IdEntity;

@Entity
@Table(name = "t_te_select_items")
public class TeSelectItemsVO extends IdEntity {
	private String selectCont;
	private Integer isAnswer;
	
	private TeExamQuestionVO question;
	
	public TeSelectItemsVO() {
		// TODO Auto-generated constructor stub
	}
	

	public TeSelectItemsVO(String selectCont, Integer isAnswer,
			TeExamQuestionVO question) {
		super();
		this.selectCont = selectCont;
		this.isAnswer = isAnswer;
		this.question = question;
	}
    @JsonIgnore
	@ManyToOne(cascade=CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinColumn(name="depd_id")
	public TeExamQuestionVO getQuestion() {
		return question;
	}
	public void setQuestion(TeExamQuestionVO question) {
		this.question = question;
	}
	public String getSelectCont() {
		return selectCont;
	}
	public void setSelectCont(String selectCont) {
		this.selectCont = selectCont;
	}
	public Integer getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(Integer isAnswer) {
		this.isAnswer = isAnswer;
	}

    @Override
    public String toString() {
        return "TeSelectItemsVO{" +
                "selectCont='" + selectCont + '\'' +
                ", isAnswer=" + isAnswer +
                '}';
    }
}
