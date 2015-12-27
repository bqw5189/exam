package com.school.exam.web.exam;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import com.school.exam.entity.*;
import com.school.exam.service.account.AccountService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.school.exam.repository.Token;
import com.school.exam.service.account.ShiroDbRealm.ShiroUser;
import com.school.exam.service.exam.ExamPaperResultService;
import com.school.exam.service.exam.ExamQuestionService;

import com.google.common.collect.Lists;
@Controller
@RequestMapping(value="/examlist")
public class ExamQuestionCotroller {
	@Autowired
	private ExamQuestionService questionService;
	@Autowired
	private ExamPaperResultService resultService;
    @Autowired
    private AccountService accountService;
	@RequestMapping(method = RequestMethod.GET)
	public String examlist(Model model) {
		ShiroUser user = getCurrentUser();
		List<TeMakeExamVO> examlist = questionService.findAll();
		if(null==examlist&&examlist.size()==0){
			model.addAttribute("message", "当前没有考试卷!");
		}else{
			for(TeMakeExamVO vo:examlist){
				Integer isHas = resultService.hasExamPaperByPersonId(user.id,vo.getId());
				vo.setIsHas(isHas);
			}
			model.addAttribute("examinfo", examlist);
		}
		return "exam/examlist";
	}
	@RequestMapping(value = "writeexam/{id}",method = RequestMethod.GET)
	@Token(save=true)
	public String getexampaper(@PathVariable(value="id") Long id, Model model) {
		if(!resultService.isHasExamByCurrentUserId(getCurrentUserId(), id)){
			TeMakeExamVO examvo = questionService.findExamQuestions(id);
			examvo = addRemark(examvo,id);
			model.addAttribute("examvo", examvo);
			return "exam/exampaper";
		}else{
			model.addAttribute("message", "你已经考试过了，不可再次考试！");
			return "exam/examlist";
		}
	}
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}

	private TeMakeExamVO addRemark(TeMakeExamVO examvo,Long id){
		List<TeExamQuestionVO> list = examvo.getQuestionList();
		long singleChoolse = questionService.getTypeNumber(1, id);
		long multChoolse = questionService.getTypeNumber(2, id);
		int s=0;
		int m=0;
		for(TeExamQuestionVO vo:list){
			if(vo.getType().equals(1)&&s==0){
				vo.setTypeRemark("单选题("+singleChoolse+"道 共"+(vo.getQuestionScore()*singleChoolse)+"分，每题"+vo.getQuestionScore()+"分)");
				++s;
				continue;
			}
			if(vo.getType().equals(2)&&m==0){
				vo.setTypeRemark("多选题("+multChoolse+"道 共"+(vo.getQuestionScore()*multChoolse)+"分，每题"+vo.getQuestionScore()+"分)");
				++m;
				continue;
			}
		}
		examvo.setQuestionList(list);
		return examvo;
	}
	/**
	 * 显示试卷
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "showexam/{id}",method = RequestMethod.GET)
	public String showPaper(@PathVariable(value="id") Long id, Model model, ServletRequest request){
		TeMakeExamVO examvo = questionService.findExamQuestions(id);
		List<TeExamQuestionVO> list = examvo.getQuestionList();
		String personId = request.getParameter("personId");
		Long userId = null;
		if(null==personId){
			//examvo = addRemark(examvo,id);
			ShiroUser user = getCurrentUser();
			userId = user.id;
			model.addAttribute("role", "user");
		}else{
			userId = Long.parseLong(personId);
			model.addAttribute("role", "teacher");
        }
        User u = accountService.getUser(Long.parseLong(personId));
        model.addAttribute("userName",u.getName());
        List<TeExamPaperResultVO> eprlist = resultService.getExamPaperByPersonId(userId, id);
		model.addAttribute("sumScore", null==eprlist?0:eprlist.get(0).getSumScore());
		model.addAttribute("examvo", examvo);
		model.addAttribute("resultlist", questionService.findByDepdIdAndPersonId(id, userId));
		
		return "exam/resultlist";
	}
	@RequestMapping(value = "submitpaper",method = RequestMethod.POST)
	@Token(remove=true)
	public String submitPaper(Model model, ServletRequest request){
		ShiroUser user = getCurrentUser();
		Map<String,String[]> param = request.getParameterMap();
		Long examId = Long.valueOf(param.get("id")[0]);
		//判断是否重复提交
		Integer isNothas = resultService.hasExamPaperByPersonId(user.id, examId);
		if(isNothas>0){
			//model.addAttribute("message", "您已经答过试卷,请不要重复答卷!");
			return "redirect:examlist";
		}else{
			TeMakeExamVO examvo = questionService.findExamQuestions(examId);
			examvo = addRemark(examvo,examId);
			List<TeExamResultVO> resultList = Lists.newArrayList();
			Double sumScore=0.0;
			List<TeExamQuestionVO> eqlist = examvo.getQuestionList();
			for(TeExamQuestionVO vo:eqlist){
				String[] selectval = param.get(vo.getId().toString());
				//结果表
				TeExamResultVO rvo = new TeExamResultVO();
				rvo.setPersonId(user.id);
				rvo.setPersonName(user.getName());
				rvo.setDepdId(examvo.getId());
				rvo.setExamQuestionId(vo.getId());
				rvo.setQuestionAnswer(vo.getQuestionAnswerId());
				rvo.setState(1);
				if(null!=selectval){
					if(vo.getType().equals(1)){
						if(vo.getQuestionAnswerId().equals(selectval[0])){
							rvo.setQuestionScore(vo.getQuestionScore());
						}else{
							rvo.setQuestionScore(0.0);
						}
						rvo.setChooseQuestionId(selectval[0]);
					}
					if(vo.getType().equals(2)){
						if(vo.getQuestionAnswerId().contentEquals(StringUtils.toDelimitedString(selectval, ","))){
							rvo.setQuestionScore(vo.getQuestionScore());
						}else{
							rvo.setQuestionScore(0.0);
						}
						rvo.setChooseQuestionId(StringUtils.toDelimitedString(selectval, ","));
					}
				}
				if(null!=rvo.getQuestionScore()){
					BigDecimal bd = BigDecimal.valueOf(rvo.getQuestionScore());
					BigDecimal sum = BigDecimal.valueOf(sumScore).add(bd);
					sumScore=sum.doubleValue();
				}
				resultList.add(rvo);
			}
			//保存结果明细
			questionService.saveExamResult(resultList);
			TeExamPaperResultVO resultvo = new TeExamPaperResultVO();
			resultvo.setExamId(examId);
			resultvo.setExamName(examvo.getExamName());
			resultvo.setExamRemark(examvo.getExamRemark());
			resultvo.setSumScore(sumScore);
			resultvo.setState(1);
			resultvo.setPersonId(user.id);
			resultvo.setPersonName(user.getName());
			//保存最终结果
			resultService.saveExamPaperResult(resultvo);
			model.addAttribute("sumScore", sumScore);
			model.addAttribute("examvo", examvo);
			model.addAttribute("resultlist", resultList);
			return "exam/resultlist";
		}
	}
	/**
	 * 取出Shiro中的当前用户
	 */
	private ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
