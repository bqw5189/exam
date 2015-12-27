package com.school.exam.web.course;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;
import com.school.exam.entity.FileUploadForm;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.service.course.CourseMainService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by baiqw on 15/11/21.
 */
@Controller
@RequestMapping("/course")
public class CourseMainController {
    private static final Logger logger = LoggerFactory.getLogger(CourseMainController.class);

    private static final String PAGE_SIZE = "10";

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("type", "类型");
    }
    @Autowired
    private CourseMainService courseService;
    @RequestMapping(method= RequestMethod.GET)

    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<TeCourseVO> course = courseService.findAllCourse(searchParams, pageNumber, pageSize, sortType);

        //获取课程信息
        model.addAttribute("course",course);
        model.addAttribute("sortType", "auto");
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "course/courselist";
    }
    @RequestMapping(value="delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
        boolean flag = courseService.isNotProject(id);
        if(!flag){
            redirectAttributes.addFlashAttribute("message", "课程下包含项目不可进行删除");
        }else{
            courseService.deleteCourse(id);
            redirectAttributes.addFlashAttribute("message", "删除课程成功");
        }

        return "redirect:/course";
    }
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        return "course/addcourse";
    }
    @RequestMapping(value = "create/save", method = RequestMethod.POST)
    public String create(@Valid TeCourseVO course, RedirectAttributes redirectAttributes,ServletRequest request) {
            courseService.saveCourse(course);
            redirectAttributes.addFlashAttribute("message", "创建课程成功");

        return "redirect:/course";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String createUpdate(@PathVariable("id") Long id,Model model) {

        model.addAttribute("course", courseService.getCourseVo(id));
        logger.warn("course.id:{}",id);
        return "course/addcourse";
    }
}
