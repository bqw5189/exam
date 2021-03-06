/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.account;

import java.util.List;

import javax.validation.Valid;

import com.school.exam.entity.TeExamPaperResultVO;
import com.school.exam.repository.ExamPaperResultDao;
import org.apache.log4j.spi.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.exam.entity.SSClassVO;
import com.school.exam.entity.User;
import com.school.exam.service.account.AccountService;
import com.school.exam.service.ssclass.SSClassService;

/**
 * 管理员管理用户的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController {
	Logger logger = org.slf4j.LoggerFactory.getLogger(UserAdminController.class);
	@Autowired
	private AccountService accountService;
    @Autowired
	private SSClassService classService;
    @Autowired
    private ExamPaperResultDao resultDao;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<User> users = accountService.getAllUser();
		model.addAttribute("users", users);

		return "account/adminUserList";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		User user = accountService.getUser(id);
		List<SSClassVO> sclass = classService.getAllSSClass();
        SSClassVO cvo = new SSClassVO();
        cvo.setId(user.getSsClass().getId());
        user.setSsClass(cvo);
		model.addAttribute("user", user);
		model.addAttribute("classLists", sclass);
		model.addAttribute("pathUrl","更新用户");
		return "account/adminUserForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user,@RequestParam("user.ssClass.id") long classId,RedirectAttributes redirectAttributes) {
        SSClassVO classVO = new SSClassVO();
        classVO = classService.getClass(classId);
		logger.debug("update class id:{}" , classVO);
        user.setSsClass(classVO);
		accountService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "更新用户" + user.getLoginName() + "成功");
		return "redirect:/admin/user";
	}
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		User user = new User();
		List<SSClassVO> sclass = classService.getAllSSClass();
		model.addAttribute("user", user);
		model.addAttribute("classLists", sclass);
		model.addAttribute("pathUrl","新增用户");
		return "account/adminUserForm";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		User user = accountService.getUser(id);
       List<TeExamPaperResultVO> resultList = resultDao.findByPersonId(user.getId());
        if(null!=resultList&&resultList.size()>0){
            redirectAttributes.addFlashAttribute("message", "当前用户" + user.getLoginName() + "已经参加考试，不能进行删除操作");
        }else{
            accountService.deleteUser(id);
            redirectAttributes.addFlashAttribute("message", "删除用户" + user.getLoginName() + "成功");
        }
        return "redirect:/admin/user";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("user", accountService.getUser(id));
		}
	}
}
