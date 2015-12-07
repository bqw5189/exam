/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.account;

import javax.validation.Valid;

import com.school.exam.entity.FileUploadForm;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.school.exam.entity.User;
import com.school.exam.service.account.AccountService;
import com.school.exam.service.ssclass.SSClassService;
import sun.jvm.hotspot.asm.Register;

import java.io.IOException;

/**
 * 用户注册的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private SSClassService classService;
    private Logger logger  = LoggerFactory.getLogger(RegisterController.class);

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

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("classLists", classService.getAllSSClass());
		return "account/register";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(@Valid User user, RedirectAttributes redirectAttributes) {
		accountService.registerUser(user);
		redirectAttributes.addFlashAttribute("username", user.getLoginName());
		return "redirect:/login";
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
