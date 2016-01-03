package com.school.exam.web.exam;

import com.google.common.collect.Lists;
import com.school.exam.entity.*;
import com.school.exam.repository.Token;
import com.school.exam.service.account.ShiroDbRealm.ShiroUser;
import com.school.exam.service.exam.ExamPaperResultService;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.AnswerService;
import com.school.exam.service.question.CourseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping(value="/answer")
public class ExamAnswerCotroller {
	@Autowired
	private AnswerService answerService;

    @Autowired
    private CourseService courseService;

	@RequestMapping(method = RequestMethod.GET)
	public String answer(Model model, @RequestParam(value = "course", defaultValue = "北校区大气PM2.5中多环芳烃分析") String course) {
        //获取课程信息
        model.addAttribute("course",courseService.findAllCourse());
		Set<Answer> list = answerService.findDinstinctUserIdByCourse(course);
		if(null==list&&list.size()==0){
			model.addAttribute("message", "当前没有考试卷!");
		}else{
            model.addAttribute("list", list);
        }
        return "student/answer";
	}

    @RequestMapping(value = "/{userId}", method = RequestMethod.GET)
    public String useranswer(Model model, @RequestParam(value = "course", defaultValue = "北校区大气PM2.5中多环芳烃分析") String course, @PathVariable("userId") Long userId) {
        //获取课程信息
        model.addAttribute("course",courseService.findAllCourse());
        List<Answer> list = answerService.findByUserIdAndCourse(userId,course);
        if(null==list&&list.size()==0){
            model.addAttribute("message", "当前没有考试卷!");
        }else{
            model.addAttribute("list", list);
        }
        return "student/useranswer";
    }
}
