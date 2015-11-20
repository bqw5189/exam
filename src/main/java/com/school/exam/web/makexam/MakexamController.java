package com.school.exam.web.makexam;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.makexam.MakexamService;
import com.school.exam.service.question.CourseService;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value="/makexam")
public class MakexamController {
	private final static Logger logger = LoggerFactory.getLogger(MakexamController.class);
	@Autowired
	private ExamQuestionService questionService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private MakexamService makexamService;
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
		List<TeMakeExamVO> makexam = null;//questionService.findAllMakeExamByProjectId(null,searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "makexam/makexamlist";
	}
	@RequestMapping(value="{id}",method=RequestMethod.GET)
	public String listQuery(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			@PathVariable(value = "id") Long id,
			Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<TeMakeExamVO> makexam = questionService.findAllMakeExamByProjectId(id,new SearchFilter("state", Operator.GTE, 0),searchParams, pageNumber, pageSize, sortType);
		//获取课程信息
		model.addAttribute("course",courseService.findAllCourse());
		model.addAttribute("makexam", makexam);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("projectId", id);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "makexam/makexamlist";
	}
	@RequestMapping(value="delete/{id}")
	public String deleteQuestion(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
		String projectId = request.getParameter("projectId");
		questionService.deleteMakeExam(id);
		redirectAttributes.addFlashAttribute("message", "删除试卷成功");
		return "redirect:/makexam/"+projectId;
	}
	@RequestMapping(value="oper/{id}")
	public String startExam(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
		String projectId = request.getParameter("projectId");
		String state = request.getParameter("state");
		if(StringUtils.isNotEmpty(state)){
			makexamService.updateState(id, Integer.parseInt(state));
			
			redirectAttributes.addFlashAttribute("message", "操作成功");
		}else{
			redirectAttributes.addFlashAttribute("message", "操作失败");
		}
		return "redirect:/makexam/"+projectId;
	}
	@RequestMapping(value = "create/{projectId}", method = RequestMethod.GET)
	public String createForm(@PathVariable(value="projectId") Long projectId,Model model) {
		TeMakeExamVO makexam = new TeMakeExamVO();
		TeProjectVO project = new TeProjectVO();
		project.setId(projectId);
		makexam.setProject(project);
		model.addAttribute("makexam", makexam);
		return "makexam/makexamForm";
	}
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid TeMakeExamVO makexam, RedirectAttributes redirectAttributes,ServletRequest request) {
		Map<String,String[]> param = request.getParameterMap();
		//question.setId(UUID.randomUUID().getLeastSignificantBits());
		String projectid = param.get("projectId")[0];
		if(null==projectid){
			redirectAttributes.addFlashAttribute("message", "创建试题失败，请选择项目后再增加试题.");
		}else{
			TeProjectVO project = new TeProjectVO(Long.valueOf(projectid));
			makexam.setProject(project);
			makexam.setState(0);
			String[] ids = param.get("questionIds");
			questionService.saveMakeExam(makexam,ids[0].split(","));
			redirectAttributes.addFlashAttribute("message", "操作成功");
			redirectAttributes.addFlashAttribute("projectId",projectid);
		}
		return "redirect:/makexam/"+projectid;
	}
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable(value="id") Long id, Model model) {
		TeMakeExamVO vo = questionService.findById(id);
		List<TeExamQuestionVO> qvo = vo.getQuestionList();
		StringBuffer sb = new StringBuffer();
		for(TeExamQuestionVO eqvo:qvo){
			sb.append(eqvo.getId()+",");
		}
		model.addAttribute("makexam", vo);
		model.addAttribute("questionIds", sb.toString());
		model.addAttribute("projectId", vo.getProject().getId());
		return "makexam/makexamForm";
	}
	
//	@RequestMapping(value = "chooseQuestion/{id}")
//	@ResponseBody
//	public Page<TeExamQuestionVO> chooseQuestion(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
//			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
//			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
//			@PathVariable(value = "id") Long id,
//			Model model,
//			ServletRequest request) {
//		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//		Page<TeExamQuestionVO> questions = questionService.findByProjectId(id,searchParams, pageNumber, pageSize, sortType);
//		//获取课程信息
//		//model.addAttribute("course",courseService.findAllCourse());
//		//TeMakeExamVO vo = questionService.findById(id);
//		//model.addAttribute("makexam", questionService.findById(id));
//		model.addAttribute("question", questions);
//		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
//		model.addAttribute("projectId", id);
//		// 将搜索条件编码成字符串，用于排序，分页的URL
//		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
//		return questions;
//	}
}
