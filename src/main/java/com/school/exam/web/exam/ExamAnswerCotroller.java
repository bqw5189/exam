package com.school.exam.web.exam;

import com.google.common.collect.Lists;
import com.school.exam.entity.*;
import com.school.exam.repository.Token;
import com.school.exam.service.account.ShiroDbRealm.ShiroUser;
import com.school.exam.service.exam.ExamPaperResultService;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.AnswerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/answer")
public class ExamAnswerCotroller {
	@Autowired
	private AnswerService answerService;

	@RequestMapping(method = RequestMethod.GET)
	public String answer(Model model) {
		List<Answer> list = answerService.findAll();
		if(null==list&&list.size()==0){
			model.addAttribute("message", "当前没有考试卷!");
		}else{
            model.addAttribute("list", list);
        }
        return "student/answer";
	}
}
