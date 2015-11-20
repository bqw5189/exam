package com.school.exam.web.question;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.CourseService;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value="/questionsee")
public class QuestionSeeController {
	private static final String PAGE_SIZE = "10";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("type", "类型");
	}
	@Autowired
	private CourseService courseService;
	@Autowired
	private ExamQuestionService questionService;
	@RequestMapping(method=RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<TeExamQuestionVO> questions = questionService.findByProjectId(null,searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("question", questions);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "question/questionlistview";
	}
	@RequestMapping(value="{id}",method=RequestMethod.GET)
	public String listQuery(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@PathVariable(value = "id") Long id,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<TeExamQuestionVO> questions = questionService.findByProjectId(id,searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("question", questions);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("projectId", id);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "question/questionlistview";
	}
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable(value="id") Long id, Model model) {
		model.addAttribute("question", courseService.getQuestion(id));
		return "question/questionDetailForm";
	}
}
