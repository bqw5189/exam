package com.school.exam.web.question;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import com.school.exam.entity.FileUploadForm;
import com.school.exam.utils.ExcelUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.entity.TeSelectItemsVO;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.CourseService;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;
import org.springside.modules.web.Servlets;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value="/question")
public class CourseController {
    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

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

		return "question/questionlist";
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
		return "question/questionlist";
	}
	@RequestMapping(value="delete/{id}")
	public String deleteQuestion(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
		boolean flag = courseService.isNotDeleteQuestion(id);
		String projectId = request.getParameter("projectId");
		if(flag){
			courseService.deleteQuestionById(id);
			redirectAttributes.addFlashAttribute("message", "删除试题成功");
		}else{
			redirectAttributes.addFlashAttribute("message", "试题已经使用不可进行删除");
		}
		return "redirect:/question/"+projectId;
	}
	@RequestMapping(value = "create/{projectId}", method = RequestMethod.GET)
	public String createForm(@PathVariable(value="projectId") Long projectId,Model model) {
		TeExamQuestionVO question = new TeExamQuestionVO();
		TeProjectVO project = new TeProjectVO();
		project.setId(projectId);
		question.setProject(project);
		model.addAttribute("question", question);
		return "question/questionForm";
	}
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid TeExamQuestionVO question, RedirectAttributes redirectAttributes,ServletRequest request) {
		Map<String,String[]> param = request.getParameterMap();
		//question.setId(UUID.randomUUID().getLeastSignificantBits());
		String projectid = param.get("projectId")[0];
		if(null==projectid){
			redirectAttributes.addFlashAttribute("message", "创建试题失败，请选择项目后再增加试题.");
		}else{
			TeProjectVO project = new TeProjectVO(Long.valueOf(projectid));
			question.setProject(project);
			question.setType(Integer.valueOf(param.get("type")[0]));
			courseService.saveQuestion(question);
			redirectAttributes.addFlashAttribute("message", "创建试题成功");
			redirectAttributes.addFlashAttribute("projectId",projectid);
		}
		return "redirect:/question/"+projectid;
	}

    @RequestMapping(value = "upload/{projectId}", method = RequestMethod.POST)
    public String create(FileUploadForm uploadForm, @PathVariable Long projectId) {
        logger.debug("upload/{}->file:{}", projectId, uploadForm);
        try {
            courseService.inputQuestion(projectId, uploadForm.getFile().getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/question/"+projectId;
    }
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateQuestion(@PathVariable(value="id") Long id, Model model) throws JsonProcessingException {
		TeExamQuestionVO question = (TeExamQuestionVO) courseService.getQuestion(id);
		model.addAttribute("question", question);
		//ObjectMapper objectMapper = new ObjectMapper();
		//model.addAttribute("items", objectMapper.writeValueAsString(question.getSelectItems()));
		return "question/questionUpdateForm";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateForm(@Valid TeExamQuestionVO question, RedirectAttributes redirectAttributes,ServletRequest request) {
		Map<String,String[]> param = request.getParameterMap();
//		Integer type =1;
//		if(null!=param.get("type")){
//			type = Integer.valueOf(param.get("type")[0]);
//		}
//		question.setType(type);
		String projectid = param.get("projectId")[0];
		TeProjectVO project = new TeProjectVO(Long.valueOf(projectid));
		question.setProject(project);
//		for(int i=1;;i++){
//			String[] cont = param.get("selectCont"+i);
//			if(null!=cont&&cont.length>0){
//				TeSelectItemsVO itmvo = new TeSelectItemsVO();
//				String id = param.get("id"+i)[0];
//				itmvo.setId(Long.parseLong(id));
//				itmvo.setSelectCont(cont[0]);
//				String answer = param.get("isAnswer"+i)[0];
//				itmvo.setIsAnswer(null==answer?0:Integer.valueOf(answer));
//				question.addSelectItem(itmvo);
//			}else{
//				break;
//			}
//		}
		courseService.saveQuestion(question);
		redirectAttributes.addFlashAttribute("message", "修改成功");
		return "redirect:/question/"+projectid;
	}

	@RequestMapping(value = "itemlist/{id}", method = RequestMethod.GET)
	public String itemList(@PathVariable(value="id") Long id,Model model) {
		SearchFilter filter = new SearchFilter("question.id", Operator.EQ, id);
		List<TeSelectItemsVO> itemlist = courseService.getSelectItemDao().findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter), TeSelectItemsVO.class));
		model.addAttribute("itemlist", itemlist);
		model.addAttribute("questionId", id);
		return "question/itemlist";
	}
	@RequestMapping(value = "createitem/{id}", method = RequestMethod.GET)
	public String createItemForm(@PathVariable(value="id") Long id,Model model) {
		TeExamQuestionVO question = new TeExamQuestionVO();
		question.setId(id);
		TeSelectItemsVO item = new TeSelectItemsVO();
		item.setQuestion(question);
		model.addAttribute("item", item);
		return "question/itemedit";
	}
	@RequestMapping(value = "updateitem/{id}", method = RequestMethod.GET)
	public String updateItemForm(@PathVariable(value="id") Long id,Model model) {
		TeSelectItemsVO item = courseService.getSelectItemDao().findOne(id);
		model.addAttribute("item", item);
		return "question/itemedit";
	}
	@RequestMapping(value = "createitem", method = RequestMethod.POST)
	public String create(@Valid TeSelectItemsVO item, RedirectAttributes redirectAttributes,ServletRequest request) {
			String questionId = request.getParameter("questionId");
			TeExamQuestionVO question = courseService.getQuestion(Long.parseLong(questionId));
			question.setId(Long.parseLong(questionId));
			item.setQuestion(question);
//			if(item.getIsAnswer()==1){
//				question.setState(1);
//			}else{
//				SearchFilter filter = new SearchFilter("question.id", Operator.EQ, questionId);
//				SearchFilter filter2 = new SearchFilter("isAnswer", Operator.EQ, 1);
//				List<TeSelectItemsVO> itemlist = courseService.getSelectItemDao().findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter,filter2), TeSelectItemsVO.class));
//				if(null!=itemlist&&itemlist.size()>0){
//					for(int i=0;i<itemlist.size();i++){
//						TeSelectItemsVO vo = itemlist.get(i);
//						if(vo.getId().equals(item.getId())){
//							
//						}
//					}
//				}else{
//					question.setState(0);
//				}
//			}
            boolean flag = true;
			item.setQuestion(question);
        if(null!=question.getQuestionAnswerId()) {
            if (question.getType().equals(1) && question.getQuestionAnswerId().length() > 0) {
                if (item.getIsAnswer().equals(1)) {
                    redirectAttributes.addFlashAttribute("message", "单选题不可以有多个答案，请正确填写选项信息！");
                    item.setIsAnswer(0);
                    flag = false;
                } else {
                    if (null != item.getId() && question.getQuestionAnswerId().equals(item.getId())) {
                        question.setQuestionAnswerId("");
                    }
                }
            }
        }
        courseService.saveItem(item);
        if(flag){
            redirectAttributes.addFlashAttribute("message", "操作成功");
        }
		return "redirect:/question/itemlist/"+questionId;
	}
	@RequestMapping(value="deleteitem/{id}")
	public String deleteItems(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
		String questionId = request.getParameter("questionId");
        TeExamQuestionVO questionVO = questionService.getQuestionById(Long.parseLong(questionId));
        String answer = questionVO.getQuestionAnswerId();
        boolean flag = courseService.isNotDeleteQuestion(questionVO.getId());
        if(flag) {
            StringBuffer sb = new StringBuffer();
            if (answer.contains(id.toString())) {
                String[] s = answer.split(",");
                for (String sigleId : s) {
                    if (!sigleId.equals(id.toString())) {
                        sb.append(sigleId + ",");
                    }
                }
                String qai = sb.toString();

                questionVO.setQuestionAnswerId(qai.substring(0, qai.length() - 1));
                questionService.saveQuestion(questionVO);
            }
            courseService.getSelectItemDao().delete(id);
            redirectAttributes.addFlashAttribute("message", "删除成功");
        }else{
            redirectAttributes.addFlashAttribute("message", "试题已经被使用不可以进行删除操作");
        }
		return "redirect:/question/itemlist/"+questionId;
	}
	
}
