/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.repository;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import com.school.exam.entity.IndexShowVO;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

@ContextConfiguration(locations = { "/applicationContext.xml" })
public class TaskDaoTest extends SpringTransactionalTestCase {

	@Autowired
	private TaskDao taskDao;
	@Autowired
	private IndexShowDao indexdao;

	/*@Test
	public void findTasksByUserId() throws Exception {
		Page<Task> tasks = taskDao.findByUserId(2L, new PageRequest(0, 100, Direction.ASC, "id"));
		assertThat(tasks.getContent()).hasSize(5);
		assertThat(tasks.getContent().get(0).getId()).isEqualTo(1);

		tasks = taskDao.findByUserId(99999L, new PageRequest(0, 100, Direction.ASC, "id"));
		assertThat(tasks.getContent()).isEmpty();
		assertThat(tasks.getContent()).isEmpty();
	}*/
	@Test
	public void findTypeById(){
//		IndexShowVO vo = indexdao.findMaxId();
//		Double sumScore = indexdao.findSumScore(id);
//		Integer totalnum = indexdao.findTotalNum(id);
//		Integer passnum = indexdao.findPassNum(id);
//		List<IndexShowVO> list = indexdao.findFivePerson(id);
//		Logger logger = LoggerFactory.getLogger(this.getClass());
//		
//		logger.warn("id:{}",id);
//		logger.warn("sale:{}",passnum/totalnum.doubleValue());
//		logger.warn("sumScore:{}",sumScore);
//		logger.warn("listsize:{}",list.size());
	}
}
