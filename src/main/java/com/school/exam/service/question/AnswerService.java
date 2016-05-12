/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.service.question;

import com.google.common.collect.Lists;
import com.school.exam.entity.Answer;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.repository.AnswerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

// Spring Bean的标识.
@Component
// 类中所有public函数都纳入事务管理的标识.
@Transactional
public class AnswerService {
    @Autowired
	private AnswerDao answerDao;



	public List<Answer> getAll() {
		return (List<Answer>) answerDao.findAll();
	}


    public void save(Answer answer) {
        Answer oldAnswer = answerDao.findByUserIdAndCourseAndTitle(answer.getUser().getId(),answer.getCourse(), answer.getTitle());
        if(null!=oldAnswer){
            answer.setId(oldAnswer.getId());
        }
        answerDao.save(answer);
    }

    public List<Answer> findAll() {
        return Lists.newArrayList(answerDao.findAll(new Sort(Sort.Direction.DESC, "id")));
    }

    public List<Answer> findByCourse(String course) {
        return answerDao.findByCourse(course);
    }
    public LinkedHashSet<Answer> findDinstinctUserIdByCourse(String course) {
        return answerDao.findDistinctUserByCourse(course);
    }

    public List<Answer> findByUserIdAndCourseOrderByAnswerDateAsc(Long userId, String course) {
        return answerDao.findByUserIdAndCourseOrderByAnswerDateAsc(userId,course);
    }

}
