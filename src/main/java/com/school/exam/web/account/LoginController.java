/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.account;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.school.exam.entity.IndexShowVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.service.account.IndexService;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.ssclass.SSClassService;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	private IndexService indexservice;
	
	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		return "account/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "account/login";
	}
	@RequestMapping(value="index",method = RequestMethod.GET)
	public String index(Model model) {
		IndexShowVO vo = indexservice.getIndexShowVo(null);
		List<IndexShowVO> personList =null;
		if(null == vo){
			vo = new IndexShowVO();
			vo.setExamName("还未有考试完成的试卷");
			vo.setSumScore(0.00);
			vo.setScale(0.0);
			vo.setPersonNum(0);
		}else{
			personList = indexservice.getListById(vo.getId());
			
		}
		List<TeMakeExamVO> makexam = indexservice.getBeforeFiveExam();
		model.addAttribute("indexvo", vo);
		model.addAttribute("personList", personList);
		model.addAttribute("makexam", makexam);
		return "account/index";
	}
	@RequestMapping(value="showindex",method = RequestMethod.GET)
	public String showindex(Model model,ServletRequest request){
		String id = request.getParameter("id");
		IndexShowVO vo = indexservice.getIndexShowVo(Long.valueOf(id));
		model.addAttribute("indexvo", vo);
		model.addAttribute("personList", indexservice.getListById(vo.getId()));
		List<TeMakeExamVO> makexam = indexservice.getBeforeFiveExam();
		model.addAttribute("makexam", makexam);
		return "account/index";
	}
}
