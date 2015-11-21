package com.school.exam.service.project;

import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.Hibernates;

import java.util.List;

/**
 * Created by baiqw on 15/11/21.
 */
@Component
@Transactional
public class ProjectService {
    private ProjectDao projectDao;
    @Autowired
    public void setProjectDao(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }
    public void addProject(TeProjectVO vo){
        projectDao.save(vo);
    }
    public void deleteProject(Long id){
        projectDao.delete(id);
    }
    /**
     * 获得所有课程及项目信息
     * @return
     */
    public Iterable<TeProjectVO> findAllCourse(){
        // SearchFilter filter = new SearchFilter("courseName", SearchFilter.Operator.LIKE, '%'+courseName+'%');
        // DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter),TeCourseVO.class)
        return projectDao.findAll();
    }
    public TeProjectVO getProjectVo(Long id){
        TeProjectVO vo = projectDao.findOne(id);
        Hibernates.initLazyProperty(vo.getCourse());
        return vo;
    }

    public List<TeProjectVO> getProjectBycoureId(Long id){
        return projectDao.findByCourseId(id);
    }
}