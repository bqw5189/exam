package com.school.exam.service.course;

import com.google.common.collect.Lists;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.repository.CourseDao;
import com.school.exam.repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.Hibernates;
import org.springside.modules.persistence.SearchFilter;

import java.util.List;
import java.util.Map;


/**
 * Created by baiqw on 15/11/21.
 */
@Component
@Transactional
public class CourseMainService {
    private CourseDao courseDao;
    private ProjectDao projectDao;
    @Autowired
    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
    @Autowired
    public void setProjectDao(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    public void saveCourse(TeCourseVO vo){
        courseDao.save(vo);
    }
    public void deleteCourse(Long id){
        courseDao.delete(id);
    }
    public boolean isNotProject(Long id){
        List<TeProjectVO> list = projectDao.findByCourseId(id);
        if(null!=list&&list.size()>0){
            return false;

        }else{
            return true;
        }
    }
    public TeCourseVO getCourseVo(Long id){
       return courseDao.findOne(id);
    }
    /**
     * 获得所有课程及项目信息
     * @return
     */
    public Page<TeCourseVO> findAllCourse(Map<String, Object> searchParams, int pageNumber, int pageSize,
                                          String sortType) {
       // SearchFilter filter = new SearchFilter("courseName", SearchFilter.Operator.LIKE, '%'+courseName+'%');
       // DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter),TeCourseVO.class)
       // List < TeCourseVO > list = (List<TeCourseVO>) courseDao.findAll();

        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<TeCourseVO> spec = buildSpecification(searchParams);
        //return questionDao.findAll(spec);
        Page<TeCourseVO > list = (Page<TeCourseVO>)  courseDao.findAll(spec, pageRequest);
        if(null!=list&&list.getContent().size()>0){
            for(TeCourseVO qvo:list){
                Hibernates.initLazyProperty(qvo.getProject());
            }
        }
        return list;
    }
    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("courseName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "courseName");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }
    /**
     * 创建动态查询条件组合.
     */
    private Specification<TeCourseVO> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
       // if(null!=projectId){
       //     filters.put("project.id", new SearchFilter("project.id", SearchFilter.Operator.EQ, projectId));
       // }
        Specification<TeCourseVO> spec = DynamicSpecifications.bySearchFilter(filters.values(), TeCourseVO.class);
        return spec;
    }

}
