package com.school.exam.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeExamPaperResultVO;

import java.util.List;

public interface ExamPaperResultDao extends PagingAndSortingRepository<TeExamPaperResultVO, Long>, JpaSpecificationExecutor<TeExamPaperResultVO>{
	public TeExamPaperResultVO findByPersonIdAndExamId(Long personId,Long examId);

    public List<TeExamPaperResultVO> findByPersonId(Long personId);

}
