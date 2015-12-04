package com.school.exam.web.project;

import com.google.common.collect.Maps;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.service.course.CourseMainService;
import com.school.exam.service.project.ProjectService;
import com.school.exam.service.question.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * Created by baiqw on 15/11/21.
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    private static final String PAGE_SIZE = "10";

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("type", "类型");
    }
    @Autowired
    private ProjectService projectService;
    @Autowired
    private CourseMainService courseService;

    @RequestMapping(value = "add/{id}",method= RequestMethod.GET)
    public String list(@PathVariable("id") Long id,Model model, ServletRequest request) {
        //获取课程信息
        model.addAttribute("project", projectService.getProjectBycoureId(id));
        model.addAttribute("sortType", "auto");
        model.addAttribute("courseId", id);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
       // model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "course/projectlist";
    }
    @RequestMapping(value="delete/{id}")
    public String deleteProject(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,ServletRequest request) {
        String courseId = request.getParameter("courseId");
            projectService.deleteProject(id);
            redirectAttributes.addFlashAttribute("message", "删除项目成功");


        return "redirect:/project/add/"+Long.parseLong(courseId);
    }
    @RequestMapping(value = "create/{id}", method = RequestMethod.GET)
    public String createForm(@PathVariable("id") Long id,Model model) {
        TeProjectVO vo = new TeProjectVO();
        TeCourseVO cvo = new TeCourseVO();
        cvo.setId(id);
        vo.setCourse(cvo);
        model.addAttribute("project",vo);
        model.addAttribute("courseId",id);
        return "course/projectedit";
    }

    @RequestMapping(value = "create/save", method = RequestMethod.POST)
    public String create(@Valid TeProjectVO project, RedirectAttributes redirectAttributes,ServletRequest request) {
        String courseId = request.getParameter("courseId");
        TeCourseVO cvo = new TeCourseVO();
        cvo.setId(Long.parseLong(courseId));
        project.setCourse(cvo);
        projectService.addProject(project);
        redirectAttributes.addFlashAttribute("message", "创建项目成功");
        return "redirect:/project/add/"+project.getCourse().getId();
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateProject(@PathVariable("id") Long id,Model model) {
        TeProjectVO vo = projectService.getProjectVo(id);
        model.addAttribute("project", vo);
        model.addAttribute("courseId",vo.getCourse().getId());
        return "course/projectedit";
    }
}
