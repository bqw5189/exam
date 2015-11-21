package com.school.exam.repository;

import com.school.exam.entity.TeProjectVO;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeCourseVO;

import java.util.List;

public interface CourseDao extends PagingAndSortingRepository<TeCourseVO, Long>, JpaSpecificationExecutor<TeCourseVO>{

}
