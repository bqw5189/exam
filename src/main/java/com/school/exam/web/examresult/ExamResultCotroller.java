package com.school.exam.web.examresult;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.school.exam.entity.TeExamPaperResultVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.rest.RestException;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.examresult.ExamResultService;
import com.school.exam.service.question.CourseService;
import com.school.exam.web.makexam.MakexamController;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;
import org.springside.modules.web.MediaTypes;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/examresult")
public class ExamResultCotroller {
	private final static Logger logger = LoggerFactory.getLogger(MakexamController.class);
	@Autowired
	private ExamQuestionService questionService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private ExamResultService resultService;
	private static final String PAGE_SIZE = "10";
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	private static Map<String, String> sortResult = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("state", "状态");
		sortResult.put("auto","姓名");
		sortResult.put("sumScore","成绩");
	}
	@RequestMapping(method=RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
		List<TeMakeExamVO> makexam = questionService.findAllMakeExamByProjectId(null,new SearchFilter("state", Operator.GTE, 1),searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "/examresult/examresultlist";
	}
	@RequestMapping(value="{id}",method=RequestMethod.GET)
	public String listQuery(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@PathVariable(value = "id") Long id,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<TeMakeExamVO> makexam = questionService.findAllMakeExamByProjectId(id,new SearchFilter("state", Operator.GTE, 1),searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("projectId", id);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "/examresult/examresultlist";
	}
	@RequestMapping(value = "seeresult/{id}", method = RequestMethod.GET)
	public String updateForm(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@PathVariable(value = "id") Long id,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<TeExamPaperResultVO> examresult = resultService.getExamResult(id, searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("examresult", examresult);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortResult);
		model.addAttribute("examId", id);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/examresult/examresultdetail";
	}
	/**
	 * 对试卷进行排名
	 * @param examId
	 * @return
	 */
//	@RequestMapping(value = "order/{examId}",method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
//	public String orderByResult(@PathVariable(value = "examId") Long examId,Model model,
//			ServletRequest request){
//		String projectId = request.getParameter("projectId");
//		if(null!=examId){
//			List<TeExamPaperResultVO> resutlist = resultService.getListOrderbySumScore(examId);
//			Collections.sort(resutlist);
//			int No=1;
//			Double score=0.0;
//			for(TeExamPaperResultVO vo:resutlist){
//				vo.setExamOrder(No);
//				if(!score.equals(vo.getSumScore())){
//					++No;
//				}
//				score = vo.getSumScore();
//			}
//			resultService.updateOrder(resutlist,examId);
//		}
//		return "redirect:examresult";
//	}
}
