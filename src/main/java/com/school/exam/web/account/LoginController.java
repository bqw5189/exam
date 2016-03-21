/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.account;

import com.google.common.collect.Maps;
import com.school.exam.entity.Answer;
import com.school.exam.entity.IndexShowVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.entity.User;
import com.school.exam.service.account.IndexService;
import com.school.exam.service.account.ShiroDbRealm;
import com.school.exam.service.question.AnswerService;
import com.school.exam.service.ssclass.SSClassService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private SSClassService ssclassService;
    @Autowired
    private AnswerService answerService;
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("type", "类型");
    }
	
	@RequestMapping(method = RequestMethod.GET)
	public String login(HttpSession session) {
        return "account/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "account/login";
	}
	@RequestMapping(value="index",method = RequestMethod.GET)
	public String index(Model model) {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        User us = indexservice.getUserById(user.id);
        if(us.getRoles().equals("teacher")){

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
        }else if(us.getRoles().equals("student")){
            List<Answer> list = answerService.findAll();
            if(null==list&&list.size()==0){
                model.addAttribute("message", "当前没有考试卷!");
            }else{
                model.addAttribute("list", list);
            }
            return "student/answer";
        }else{
            //获取课程信息
            model.addAttribute("ssclass", ssclassService.getAllSSClass());
            model.addAttribute("sortType", "auto");
            model.addAttribute("sortTypes", sortTypes);
            // 将搜索条件编码成字符串，用于排序，分页的URL
            // model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

            return "ssclass/ssclasslist";
        }

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
