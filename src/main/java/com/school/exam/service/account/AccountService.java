/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.school.exam.service.account;

import com.school.exam.entity.SSClassVO;
import com.school.exam.entity.User;
import com.school.exam.repository.UserDao;
import com.school.exam.service.ServiceException;
import com.school.exam.service.account.ShiroDbRealm.ShiroUser;
import com.school.exam.service.ssclass.SSClassService;
import com.school.exam.utils.ExcelUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import java.io.InputStream;
import java.util.List;

/**
 * 用户管理类.
 * 
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class AccountService {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	private UserDao userDao;
	private Clock clock = Clock.DEFAULT;

    @Autowired
    private SSClassService ssClassService;

	public List<User> getAllUser() {
		return (List<User>) userDao.findByRolesOrderByIdDesc("student");
	}

	public User getUser(Long id) {
		return userDao.findOne(id);
	}

	public User findUserByLoginName(String loginName) {
		logger.debug("findUserByLoginName:{}", loginName);
		User user = userDao.findByLoginName(loginName);
//		logger.debug("user login:{}", user.getName());
		return user;
	}

	public void registerUser(User user) {
		entryptPassword(user);
		user.setRoles("student");
		user.setRegisterDate(clock.getCurrentDate());
		if(null!=user.getSsClass().getId()){
			SSClassVO ssclass = new SSClassVO();
			ssclass.setId(user.getSsClass().getId());
			user.setSsClass(ssclass);
			userDao.save(user);
		}else{
			new Exception("班级不可为空");
		}
		
	}

	public void updateUser(User user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		SSClassVO ssclass = new SSClassVO();
		ssclass.setId(user.getSsClass().getId());
		user.setSsClass(ssclass);
		userDao.save(user);
	}

	public void deleteUser(Long id) {
		if (isSupervisor(id)) {
			logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
			throw new ServiceException("不能删除超级管理员用户");
		}
		userDao.delete(id);
		
	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id) {
		return id == 1;
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.loginName;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setClock(Clock clock) {
		this.clock = clock;
	}

    public void inputUser(InputStream inputStream) {
        List<List<String>> userList = ExcelUtils.toList(inputStream);

        for(List<String> row: userList){

            SSClassVO ssClassVO =ssClassService.findClassByClassName(row.get(0));

            if (null == ssClassVO){
                ssClassVO = new SSClassVO();
                ssClassVO.setClassName(row.get(0));
                ssClassService.registerClass(ssClassVO);
            }


            User user = userDao.findByLoginName(row.get(2)+"");
            if (null == user){
                user = new User();
                user.setLoginName(row.get(2));
                user.setRoles("student");
                user.setPlainPassword(StringUtils.trim(row.get(3)));
                user.setName(row.get(1));
                user.setSsClass(ssClassVO);

                registerUser(user);

            }

        }

    }
}
