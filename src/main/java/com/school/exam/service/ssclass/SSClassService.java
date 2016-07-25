package com.school.exam.service.ssclass;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.school.exam.entity.SSClassVO;
import com.school.exam.entity.User;
import com.school.exam.repository.ClassDao;
import com.school.exam.repository.UserDao;
import com.school.exam.service.ServiceException;
import com.school.exam.web.question.CourseController;

@Component
@Transactional
public class SSClassService {
	private ClassDao classDao;
	private UserDao userDao;
	private static final Logger logger = LoggerFactory.getLogger(SSClassService.class);
	public UserDao getUserDao() {
		return userDao;
	}
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public List<SSClassVO> getAllSSClass() {
		return (List<SSClassVO>) classDao.findByOrderByIdDesc();
	}

	public SSClassVO getClass(Long id) {
		return classDao.findOne(id);
	}

	public SSClassVO findClassByClassName(String className) {
		return classDao.findByClassName(className);
	}

	public void registerClass(SSClassVO classvo) {
		if (StringUtils.isNotBlank(classvo.getClassName())) {
			classDao.save(classvo);
		}
	}

	public void updateClass(SSClassVO classvo) {
		if (StringUtils.isNotBlank(classvo.getClassName())) {
			classDao.save(classvo);
		}
	}

	public boolean deleteClass(Long id) {
		if (!isHasStudent(id)) {
			return false;
		}else{
			classDao.delete(id);
			return true;
		}
	}
	/**
	 * 判断班级下是否有学生
	 * @param id
	 * @return
	 */
	private boolean isHasStudent(Long id){
		logger.warn("======id:========{}",id);
		Integer num = userDao.querySsclassByid(id);
		logger.warn("----- 个数-{}------",num);
		if(num.equals(0)){
			return true;
		}else{
			return false;
		}
	}
	public ClassDao getClassDao() {
		return classDao;
	}
	@Autowired
	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
	}
	
}
