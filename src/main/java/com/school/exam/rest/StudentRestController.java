/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.rest;

import com.school.exam.entity.*;
import com.school.exam.service.question.AnswerService;
import com.school.exam.service.task.TaskService;
import com.school.exam.web.student.StudentController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
    public String answer(@RequestParam(defaultValue = "北校区大气PM2.5中多环芳烃分析") String course,@RequestParam String title, @RequestParam long userId, @RequestParam(required = false) String answer){

       Answer answerObj = new Answer();

        answerObj.setTitle(title);
        answerObj.setCourse(course);
        answerObj.setAnswer(answer);

        User user = new User();
        user.setId(userId);

        answerObj.setUser(user);

        answerService.save(answerObj);

        return "true";
    }



	@RequestMapping(method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
	public List<CourseResource> list(@RequestParam(defaultValue = StudentController.COURSE_NAME) String courseName,@RequestParam String project, @RequestParam String step, @RequestParam(required = false) String substep){
        List<CourseResource> resources = new ArrayList<CourseResource>();

        resources.addAll(StudentController.COURSE_MAP.get(courseName).getSubEntitys().get(project).getSubEntitys().get(step).getSubEntitys().get(substep).getResources());

		return resources;
	}

}
