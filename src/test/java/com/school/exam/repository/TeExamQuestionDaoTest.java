/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.repository;

import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeSelectItemsVO;
import com.school.exam.excel.ParseExcelTest;
import com.school.exam.utils.ExcelUtils;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import java.io.InputStream;
import java.util.List;

@ContextConfiguration(locations = { "/applicationContext.xml" })
public class TeExamQuestionDaoTest extends SpringTransactionalTestCase {

	@Autowired
	private ExamQuestionDao examQuestionDao;
	@Autowired
	private SelectItemsDao selectItemsDao;

	@Test
	public void add(){
        InputStream stream = ParseExcelTest.class.getClassLoader().getResourceAsStream("exam.xls");
        List<List<String>> list = ExcelUtils.toList(stream);

        List<TeExamQuestionVO> questionExamVOs = ExcelUtils.toQuestion(200l, list);
        examQuestionDao.save(questionExamVOs);
        for (TeExamQuestionVO examQuestionVO: questionExamVOs){
            String answerIds = getAswerIds(examQuestionVO.getSelectItems());
            examQuestionVO.setQuestionAnswerId(answerIds);
            examQuestionDao.save(examQuestionVO);
        }

	}

    private String getAswerIds(List<TeSelectItemsVO> selectItems) {
        String result = "";

        for (TeSelectItemsVO selectItemsVO: selectItems){
            if (selectItemsVO.getIsAnswer() == ExcelUtils.ANSWER_TRUE) {
                if (StringUtils.isEmpty(result)) {
                    result += selectItemsVO.getId();
                }else{
                    result += "," + selectItemsVO.getId();
                }
            }
        }

        return result;
    }
}
