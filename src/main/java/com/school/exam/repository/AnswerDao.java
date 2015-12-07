/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.repository;

import com.school.exam.entity.Answer;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AnswerDao extends PagingAndSortingRepository<Answer, Long>, JpaSpecificationExecutor<Answer> {

}
