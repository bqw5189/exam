package com.school.exam.repository;

import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeProjectVO;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by baiqw on 15/11/21.
 */
public interface ProjectDao extends PagingAndSortingRepository<TeProjectVO, Long>, JpaSpecificationExecutor<TeProjectVO> {
    public List<TeProjectVO> findByCourseId(Long courseId);

    TeProjectVO findByProjectName(String projectName);
}
