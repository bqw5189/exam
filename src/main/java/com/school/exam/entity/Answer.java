/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.sql.Date;

//JPA标识
@Entity
@Table(name = "t_te_answer")
public class Answer extends IdEntity {

    private String course;
	private String title;
    private String answer;
    private String type;
    private String fileName;
    private User user;

    private Date answerDate = new Date(System.currentTimeMillis());


    // JPA 基于class_id列的多对一关系定义
    @ManyToOne(fetch = FetchType.EAGER,targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName="id")
    public User getUser() {
        return user;
    }


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    public Date getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Date answerDate) {
        this.answerDate = answerDate;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getAnswer() {
        return answer;
    }

    @Column(name="c_type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Transient
    public String getFileName() {
        return this.getUser().getId() + "-" + this.getAnswer();
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Answer)) return false;

        Answer answer = (Answer) o;

        if (!course.equals(answer.course)) return false;
        if (!user.equals(answer.user)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = course.hashCode();
        result = 31 * result + user.hashCode();
        return result;
    }
}
