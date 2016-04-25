/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.student;

import com.google.common.collect.Lists;
import com.school.exam.entity.*;
import com.school.exam.repository.Token;
import com.school.exam.service.account.ShiroDbRealm;
import com.school.exam.service.exam.ExamPaperResultService;
import com.school.exam.service.exam.ExamQuestionService;
import com.school.exam.service.question.WordsService;
import com.school.exam.utils.ExcelUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.web.MediaTypes;

import javax.servlet.ServletRequest;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Student管理的Controller, 使用Restful风格的Urls:
 * 
 * List page : GET /student/
 * Create page : GET /student/create
 * Create action : POST /student/create
 * Update page : GET /student/update/{id}
 * Update action : POST /student/update
 * Delete action : GET /student/delete/{id}
 * 
 * @author baiqw
 */
@Controller
@RequestMapping(value = "/student")
public class StudentController {

    public static Map<String, String> NAV_MAP = new LinkedHashMap<String, String>();
    public static Map<String, Course> COURSE_MAP = new LinkedHashMap<String, Course>();
    public static List<List<String>> RESOURCES = new ArrayList<List<String>>();
    public static List<List<String>> IMAGES = new ArrayList<List<String>>();
    public static final String COURSE_NAME = "复杂基体有机物指标分析";

    static{
        NAV_MAP.put("首页", "student/");
        NAV_MAP.put("课程导学", "student/classes/index");
        NAV_MAP.put("课程学习", "student/classes/study");
        NAV_MAP.put("模拟实验室", "student/testroom");
        NAV_MAP.put("习题库", "student/examlist");
//        NAV_MAP.put("习题库", "examlist");
        NAV_MAP.put("参考资料", "student/classes/books");
        NAV_MAP.put("名词索引", "student/words");
        NAV_MAP.put("视频索引", "student/classes/moves");
        NAV_MAP.put("动画索引", "student/classes/flash");
        NAV_MAP.put("图片索引", "student/classes/images");

        InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("classes.xls");
        InputStream inputStreamImages = Thread.currentThread().getContextClassLoader().getResourceAsStream("images.xls");

        IMAGES.addAll(ExcelUtils.toList(inputStreamImages));
        RESOURCES.addAll(ExcelUtils.toList(inputStream));
        COURSE_MAP.putAll(ExcelUtils.toCourse(RESOURCES));



    }

    @Autowired
    private ExamQuestionService questionService;
    @Autowired
    private ExamPaperResultService resultService;
    @Autowired
    private WordsService wordsService;
    private Logger logger = LoggerFactory.getLogger(StudentController.class);

    @RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "首页");
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        logger.debug("className:{}", user.getClassName());
		return "student" + "/index";
	}

    public List<List<String>> getResourceByTaskName(String taskName, List<List<String>> res){
        List<List<String>> resource = new ArrayList<List<String>>();

        for (List<String> r: res){
            if (taskName.equals(r.get(1))){
                resource.add(r);
            }
        }

//        System.out.println("resource = " + resource.size());

        return resource;
    }

    @RequestMapping(value = "classes/images", method = RequestMethod.GET)
    public String images(Model model, @RequestParam(value = "taskName", defaultValue = "北校区大气PM2.5中多环芳烃分析") String taskName) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "图片索引");



        model.addAttribute("resources",getResourceByTaskName(taskName, IMAGES));

        return NAV_MAP.get("图片索引");
    }

    @RequestMapping(value = "classes/flash", method = RequestMethod.GET)
    public String flash(Model model, @RequestParam(value = "taskName", defaultValue = "北校区大气PM2.5中多环芳烃分析") String taskName) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "动画索引");
        model.addAttribute("resources",getResourceByTaskName(taskName, RESOURCES));

        return NAV_MAP.get("动画索引");
    }

    @RequestMapping(value = "classes/moves", method = RequestMethod.GET)
    public String moves(Model model, @RequestParam(value = "taskName", defaultValue = "北校区大气PM2.5中多环芳烃分析") String taskName) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "视频索引");
        model.addAttribute("resources",getResourceByTaskName(taskName, RESOURCES));

        return NAV_MAP.get("视频索引");
    }

    @RequestMapping(value = "classes/books", method = RequestMethod.GET)
    public String books(Model model) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "参考资料");
        model.addAttribute("course",COURSE_MAP);

        return NAV_MAP.get("参考资料");
    }

    @RequestMapping(value = "testroom", method = RequestMethod.GET)
    public String testroom(Model model) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "模拟实验室");
        model.addAttribute("course",COURSE_MAP);

        return NAV_MAP.get("模拟实验室");
    }

    @RequestMapping(value = "classes/study", method = RequestMethod.GET)
    public String classes(Model model) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "课程学习");
        model.addAttribute("course",COURSE_MAP);

        return NAV_MAP.get("课程学习");
    }
    @RequestMapping(value = "classes/index", method = RequestMethod.GET)
    public String classIndex(Model model) {
        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "课程导学");
        return NAV_MAP.get("课程导学");
    }

    @RequestMapping(value = "project", method = RequestMethod.GET)
    public String project(Model model, @RequestParam("project_title") String projectTitle, @RequestParam("task_title") String taskTitle) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "课程学习");
        model.addAttribute("course", COURSE_MAP.get(COURSE_NAME).getSubEntitys()
                .get(projectTitle));
        model.addAttribute("currentProject", projectTitle);
        model.addAttribute("currentTask", taskTitle);

        model.addAttribute("resourcePath", "pmfj");

        return "student/classes/project";
    }

    @RequestMapping(value = "words", method = RequestMethod.GET)
    public String project(Model model, @RequestParam(defaultValue = "北校区大气PM2.5中多环芳烃分析") String type) {

        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "名词索引");
        model.addAttribute("words",wordsService.findAll());

        return NAV_MAP.get("名词索引");
    }

    @RequestMapping(value = "examlist", method = RequestMethod.GET)
    @Token(save=true)
    public String examlist(@RequestParam(defaultValue = "北校区大气PM2.5中多环芳烃分析") String examName, Model model) {
        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "习题库");
        model.addAttribute("course", COURSE_MAP);


        ShiroDbRealm.ShiroUser user = getCurrentUser();
        List<TeMakeExamVO> examlist = questionService.findByExamName(examName);
        TeMakeExamVO teMakeExamVO = null;
        if (null == examlist || examlist.size() == 0) {
            model.addAttribute("message", "当前没有考试卷!");
            return NAV_MAP.get("首页");
        }else{
            teMakeExamVO = examlist.get(0);

            if (!resultService.isHasExamByCurrentUserId(user.id, teMakeExamVO.getId())) {
                TeMakeExamVO examvo = questionService.findExamQuestions(teMakeExamVO.getId());
                examvo = addRemark(examvo, teMakeExamVO.getId());
                model.addAttribute("examvo", examvo);
                model.addAttribute("examName", examName);

                return NAV_MAP.get("习题库");
            }else{
                TeMakeExamVO examvo = questionService.findExamQuestions(teMakeExamVO.getId());
                List<TeExamQuestionVO> list = examvo.getQuestionList();

                List<TeExamPaperResultVO> eprlist = resultService.getExamPaperByPersonId(user.id, teMakeExamVO.getId());
                model.addAttribute("sumScore", null == eprlist ? 0 : eprlist.get(0).getSumScore());
                model.addAttribute("examvo", examvo);
                model.addAttribute("resultlist", questionService.findByDepdIdAndPersonId(teMakeExamVO.getId(), user.id));

                return "student/resultlist";
            }

        }


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

    @RequestMapping(value = "submitpaper",method = RequestMethod.POST)
    @Token(remove=true)
    public String submitPaper(Model model, ServletRequest request){
        ShiroDbRealm.ShiroUser user = getCurrentUser();
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
            model.addAttribute("nav", NAV_MAP);

            return "student/resultlist";
        }
    }

    /**
     * 取出Shiro中的当前用户
     */
    private ShiroDbRealm.ShiroUser getCurrentUser() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user;
    }


    @RequestMapping(value = "answer", method = RequestMethod.POST,produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String answerFile(AnswerVO answerVO){

        logger.debug("upload file:{}", answerVO.getFile().getName());
//        Answer answerObj = new Answer();
//
//        answerObj.setTitle(title);
//        answerObj.setCourse(course);
//        answerObj.setAnswer(answer);
//
//        User user = new User();
//        user.setId(userId);
//
//        answerObj.setUser(user);
//
//        answerService.save(answerObj);

        return "true";
    }

}
