package com.school.exam.web.exam;

import com.school.exam.entity.Answer;
import com.school.exam.entity.User;
import com.school.exam.service.account.AccountService;
import com.school.exam.service.question.AnswerService;
import com.school.exam.service.question.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(value="/document")
public class ExamDocumentCotroller {
	@Autowired
	private AnswerService answerService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String document(Model model, @RequestParam(value = "course", defaultValue = "北校区大气PM2.5中多环芳烃分析") String course) {
        //获取课程信息
        model.addAttribute("course",courseService.findAllCourse());
		Set<Answer> list = answerService.findDinstinctUserIdByCourse(course);
		if(null==list&&list.size()==0){
			model.addAttribute("message", "当前没有考试卷!");
		}else{
            model.addAttribute("list", list);
        }
        return "student/document";
	}

    @RequestMapping(value = "/{userId}", method = RequestMethod.GET)
    public String userdocument(Model model, @RequestParam(value = "course", defaultValue = "北校区大气PM2.5中多环芳烃分析") String course, @PathVariable("userId") Long userId) {
        //获取课程信息
        model.addAttribute("course",courseService.findAllCourse());
        User user = accountService.getUser(userId);
        List<Answer> list = answerService.findByUserIdAndCourseOrderByAnswerDateAsc(userId,course);
        if(null==list&&list.size()==0){
            model.addAttribute("message", "当前没有考试卷!");
        }else{
            model.addAttribute("list", list);
            model.addAttribute("user", user);
            model.addAttribute("courseName", course);
        }
        return "student/userdocument";
    }
}
