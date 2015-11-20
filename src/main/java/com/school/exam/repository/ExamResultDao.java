package com.school.exam.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeExamResultVO;

public interface ExamResultDao extends JpaSpecificationExecutor<TeExamResultVO>,PagingAndSortingRepository<TeExamResultVO, Long>{
}
