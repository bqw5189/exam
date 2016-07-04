package com.school.exam.web.ssclass;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.school.exam.entity.SSClassVO;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.service.course.CourseMainService;
import com.school.exam.service.ssclass.SSClassService;
import com.school.exam.web.project.ProjectController;

@Controller
@RequestMapping(value="/ssclass")
public class ClassController {
	 private static final Logger logger = LoggerFactory.getLogger(ClassController.class);

	    private static final String PAGE_SIZE = "10";

	    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	    static {
	        sortTypes.put("auto", "自动");
	        sortTypes.put("type", "类型");
	    }
	    @Autowired
	    private SSClassService ssclassService;

	    @RequestMapping(method=RequestMethod.GET)
	    public String list(Model model, ServletRequest request) {
	        //获取课程信息
	        model.addAttribute("ssclass", ssclassService.getAllSSClass());
	        model.addAttribute("sortType", "auto");
	        model.addAttribute("sortTypes", sortTypes);
	        // 将搜索条件编码成字符串，用于排序，分页的URL
	       // model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

	        return "ssclass/ssclasslist";
	    }
	    @RequestMapping(value="delete/{id}")
	    public String deleteProject(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
	        //String courseId = request.getParameter("courseId");
	            boolean flag = ssclassService.deleteClass(id);
	            if(!flag){
	            	redirectAttributes.addFlashAttribute("message", "不能删除班级，班级里还有学生");
	            }else{
	            	redirectAttributes.addFlashAttribute("message", "删除班级成功");
	            }
	        return "redirect:/ssclass";
	    }
	    @RequestMapping(value = "create", method = RequestMethod.GET)
	    public String createForm(Model model) {
	        SSClassVO vo = new SSClassVO();
	        model.addAttribute("ssclass",vo);
	        return "ssclass/ssclassedit";
	    }

	    @RequestMapping(value = "create/save", method = RequestMethod.POST)
	    public String create(@Valid SSClassVO vo, RedirectAttributes redirectAttributes,ServletRequest request) {
			SSClassVO ssClassVO = ssclassService.findClassByClassName(vo.getClassName());
			if (vo!=null && ssClassVO != null && ssClassVO.getId() == vo.getId()){
				ssClassVO = null;
			}

			if (null == vo.getId()){ //create
				if (null == ssClassVO) {
					ssclassService.registerClass(vo);
					redirectAttributes.addFlashAttribute("message", "创建班级成功");
				}else{
					redirectAttributes.addFlashAttribute("message", "创建班级失败," + vo.getClassName() + "班级名称已存在!");
				}
			}else{ //update
				if (null == ssClassVO) {
					ssclassService.registerClass(vo);
					redirectAttributes.addFlashAttribute("message", "更新班级成功");
				}else{
//					if (vo.getId() != ssClassVO.getId()){
//						ssclassService.registerClass(vo);
//						redirectAttributes.addFlashAttribute("message", "更新班级成功");
//					}else{
						redirectAttributes.addFlashAttribute("message", "更新班级失败," + vo.getClassName() + "班级名称已存在!");
//					}

				}
			}
	        return "redirect:/ssclass";
	    }

	    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	    public String updateProject(@PathVariable("id") Long id,Model model) {
	    	SSClassVO vo = ssclassService.getClass(id);
	    	model.addAttribute("ssclass",vo);
	        return "ssclass/ssclassedit";
	    }
}
