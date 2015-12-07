/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.rest;

import com.school.exam.entity.Answer;
import com.school.exam.entity.Course;
import com.school.exam.entity.CourseResource;
import com.school.exam.entity.Task;
import com.school.exam.service.question.AnswerService;
import com.school.exam.service.task.TaskService;
import com.school.exam.web.student.StudentController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import org.springside.modules.beanvalidator.BeanValidators;
import org.springside.modules.web.MediaTypes;

import javax.validation.Validator;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

/**
 * Student的Restful API的Controller.
 * 
 * @author calvin
 */
@RestController
@RequestMapping(value = "/api/v1/student")
public class StudentRestController {
    @Autowired
    private AnswerService answerService;

	private static Logger logger = LoggerFactory.getLogger(StudentController.class);




    @RequestMapping(value = "answer", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    public String answer(@RequestParam String title, @RequestParam String email, @RequestParam(required = false) String answer){
       Answer answerObj = new Answer();
        answerObj.setTitle(title);
        answerObj.setEmail(email);
        answerObj.setAnswer(answer);

        answerService.save(answerObj);

        return "";
    }

	@RequestMapping(method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
	public List<CourseResource> list(@RequestParam String project, @RequestParam String step, @RequestParam(required = false) String substep){
        List<CourseResource> resources = new ArrayList<CourseResource>();

        resources.addAll(StudentController.COURSE_MAP.get(com.school.exam.web.student.StudentController.COURSE_NAME).getSubEntitys().get(project).getSubEntitys().get(step).getSubEntitys().get(substep).getResources());

		return resources;
	}

}
