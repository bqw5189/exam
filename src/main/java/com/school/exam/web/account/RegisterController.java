/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.account;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import com.school.exam.entity.FileUploadForm;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.exam.entity.SSClassVO;
import com.school.exam.entity.User;
import com.school.exam.service.account.AccountService;
import com.school.exam.service.ssclass.SSClassService;

/**
 * 用户注册的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	Logger logger = org.slf4j.LoggerFactory.getLogger(UserAdminController.class);
	@Autowired
	private AccountService accountService;
	@Autowired
	private SSClassService classService;

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm(Model model) {
		List<SSClassVO> sclass = classService.getAllSSClass();
		model.addAttribute("classLists", sclass);
		model.addAttribute("pathUrl","新增用户");
		return "account/register";
	}

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String create(FileUploadForm uploadForm) {
        logger.debug("upload/->file:{}", uploadForm);
        try {
            accountService.inputUser(uploadForm.getFile().getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/user";
    }

	@RequestMapping(method = RequestMethod.POST)
	public String register(@Valid User user, RedirectAttributes redirectAttributes) {
		SSClassVO scvo = classService.getClass(user.getSsClass().getId());
		if(scvo.getClassName().contains("管理员")){
			user.setRoles("admin");
		}else if(scvo.getClassName().contains("老师")){
			user.setRoles("teacher");
		}else{
			user.setRoles("student");
		}
		accountService.registerUser(user);
		redirectAttributes.addFlashAttribute("message", "新增用户" + user.getLoginName() + "成功");
		return "redirect:/admin/user";
	}

	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("loginName") String loginName) {
		if (accountService.findUserByLoginName(loginName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
