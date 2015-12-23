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
import java.util.List;

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
        answerDao.save(answer);
    }

    public List<Answer> findAll() {
        return Lists.newArrayList(answerDao.findAll(new Sort(Sort.Direction.DESC, "id")));
    }
}
