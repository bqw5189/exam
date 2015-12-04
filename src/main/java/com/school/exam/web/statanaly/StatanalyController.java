package com.school.exam.web.statanaly;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.CourseService;
import com.school.exam.service.statanaly.StatanalyService;
import com.school.exam.web.makexam.MakexamController;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/statanaly")
public class StatanalyController {
	private final static Logger logger = LoggerFactory.getLogger(MakexamController.class);
	@Autowired
	private ExamQuestionService questionService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StatanalyService statanalyService;
	private static final String PAGE_SIZE = "10";
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("state", "状态");
	}
	@RequestMapping(method=RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<TeMakeExamVO> makexam = null;//questionService.findAllMakeExamByProjectId(null,new SearchFilter("state", Operator.GTE, 2),searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "statanaly/statanalylist";
	}
	@RequestMapping(value="{id}",method=RequestMethod.GET)
	public String listQuery(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@PathVariable(value = "id") Long id,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<TeMakeExamVO> makexam = questionService.findAllMakeExamByProjectId(id,new SearchFilter("state", Operator.GTE, 2),searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("projectId", id);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "statanaly/statanalylist";
	}
	@RequestMapping(value="/statanalyquery/{id}",method=RequestMethod.GET)
	public String statanalyquery(@PathVariable(value = "id") Long id,Model model,ServletRequest request){
		model.addAttribute("exam",questionService.findById(id));
		model.addAttribute("analylist", statanalyService.satatanalyQuery(id));
		return "statanaly/statanalyquery";
	}
	@RequestMapping(value="/detail/{id}",method=RequestMethod.GET)
	public String detail(@PathVariable(value = "id") Long id,@RequestParam(value = "examId") Long examId,Model model,ServletRequest request){
		if(null!=examId){
			model.addAttribute("analydetail", statanalyService.satatanalyDetail(id,examId));
		}
		return "statanaly/statanalydetail";
	}

}
