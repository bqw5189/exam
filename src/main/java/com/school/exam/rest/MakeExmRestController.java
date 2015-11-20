/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.rest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestOperations;
import com.school.exam.entity.TeExamPaperResultVO;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.examresult.ExamResultService;
import org.springside.modules.web.MediaTypes;
import org.springside.modules.web.Servlets;

/**
 * Task的Restful API的Controller.
 * 
 * @author calvin
 */
@RestController
@RequestMapping(value = "/api/v1/ajaxmakexam")
public class MakeExmRestController {

	private static Logger logger = LoggerFactory.getLogger(MakeExmRestController.class);

	@Autowired
	private ExamQuestionService questionService;
	@Autowired
	private ExamResultService resultService;
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
	public List<TeExamQuestionVO> get(@PathVariable(value = "id") Long id,
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "10") int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			ServletRequest request
			){
		//Map<String, Object> searchParams = Maps.newHashMap();
		//searchParams.put("search_LIKE_questionCont", "");
		//searchParams.put("", value)
		//Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		//filters.put("project.id", new SearchFilter("project.id", Operator.EQ, id));
		//new SearchFilter("project.id", Operator.EQ, id).parse(searchParams);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		//List<TeExamQuestionVO> questions =questionService.findByid(id);
		//return questions;
		
		//List<TeExamQuestionVO> questions = questionService.findAllQuestionByProjectId(id, searchParams, pageNumber, pageSize, sortType);
		List<TeExamQuestionVO> questions = questionService.findValidQuestionByProjectId(id);
		if (questions == null) {
			String message = "项目不存在(id:" + id + ")";
			logger.warn(message);
			throw new RestException(HttpStatus.NOT_FOUND, message);
		}
		String ids = request.getParameter("questionIds");
		if(StringUtils.isNotEmpty(ids)){
			for(TeExamQuestionVO vo : questions){
				if(ids.indexOf(vo.getId()+"")>-1){
					vo.setChecked("1");
				}else{
					vo.setChecked("0");
				}
			}
		}
		return questions;
	}
	/**
	 * 获取选择的试题
	 * @param questionIds
	 * @return
	 */
	@RequestMapping(value = "/selectquestion/{questionIds}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
	public List<TeExamQuestionVO> getSelectQuetion(@PathVariable(value = "questionIds") String questionIds){
		if(StringUtils.isNotEmpty(questionIds)){
			return questionService.findByids(questionIds);
		}else{
			return new ArrayList();
		}
	}
	/**
	 * 对试卷进行排名
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "/order/{examId}",method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
	public void orderByResult(@PathVariable(value = "examId") Long examId){
		if(null!=examId){
			List<TeExamPaperResultVO> resutlist = resultService.getListOrderbySumScore(examId);
			///.sort(resutlist,Comparators.getComparator());
			//logger.warn("sort:{}",resutlist.get(0).getSumScore());
			//logger.warn("sort:{}",resutlist.get(1).getSumScore());
			Collections.sort(resutlist);
			//logger.warn("sort1:{}",resutlist.get(0).getSumScore());
			//logger.warn("sort1:{}",resutlist.get(1).getSumScore());
			int No=1;
			Double score=-0.0;
			for(TeExamPaperResultVO vo:resutlist){
				if(score!=-0.0&&!score.equals(vo.getSumScore())){
					++No;
				}
				vo.setExamOrder(No);
				vo.setState(2);
				score = vo.getSumScore();
			}
			resultService.updateOrder(resutlist,examId);
		}else{
			throw new RestException(HttpStatus.NOT_FOUND, "排名失败");
		}
	}

}
