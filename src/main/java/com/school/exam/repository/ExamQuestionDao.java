package com.school.exam.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeExamQuestionVO;

public interface ExamQuestionDao extends PagingAndSortingRepository<TeExamQuestionVO, Long>, JpaSpecificationExecutor<TeExamQuestionVO> {
	@Modifying
	@Query("select count(id) from TeExamQuestionVO where type=?1 and questionId=?2")
	public Integer findCountBytype(Integer type,Long questionId);
	@Modifying
	@Query("update TeExamQuestionVO set questionAnswerId=?1 where id=?2")
	public Integer updateQuestion(String answerId,Long id);
}
