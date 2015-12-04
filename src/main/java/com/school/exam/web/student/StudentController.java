/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.web.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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

    private static Map<String, String> NAV_MAP = new LinkedHashMap<String, String>();

    static{
        NAV_MAP.put("首页", "student/");
        NAV_MAP.put("课程导学", "student/classes/index");
        NAV_MAP.put("课程学习", "student/classes/study");
        NAV_MAP.put("模拟实验室", "student/testroom");
        NAV_MAP.put("习题库", "login/index");
        NAV_MAP.put("参考资料", "student/classes/lib/books");
        NAV_MAP.put("名词索引", "student/classes/lib/words");
        NAV_MAP.put("视频索引", "student/classes/lib/moves");
        NAV_MAP.put("动画索引", "student/classes/lib/flash");
        NAV_MAP.put("图片索引", "student/classes/lib/images");
    }

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "首页");
		return "student/index";
	}

    @RequestMapping(value = "classes/study", method = RequestMethod.GET)
    public String classes(Model model) {
        model.addAttribute("nav", NAV_MAP);
        model.addAttribute("curent", "课程学习");
        return NAV_MAP.get("课程学习");
    }
}
