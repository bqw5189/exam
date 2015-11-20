package com.school.exam.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeCourseVO;

public interface CourseDao extends PagingAndSortingRepository<TeCourseVO, Long>, JpaSpecificationExecutor<TeCourseVO>{
}
