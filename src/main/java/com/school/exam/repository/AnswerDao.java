/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.repository;

import com.school.exam.entity.Answer;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.LinkedHashSet;
import java.util.List;

public interface AnswerDao extends PagingAndSortingRepository<Answer, Long>, JpaSpecificationExecutor<Answer> {

    List<Answer> findByCourse(String course);
    //@Query("select distinct a.user, a.course from Answer a where a.course=?1 ")
//    @Dist
    LinkedHashSet<Answer> findDistinctUserByCourse(String course);
//    @Query("select distinct a.user, a.course from Answer a")
//    LinkedHashSet<Answer> findAllDistinctUser();

    List<Answer> findByUserIdAndCourseOrderByAnswerDateAsc(Long userId, String course);

    Answer findByUserIdAndCourseAndTitle(Long id,String course, String title);

    LinkedHashSet<Answer> findDinstinctUserIdByType(String type);
}
