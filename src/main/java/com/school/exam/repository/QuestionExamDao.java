package com.school.exam.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeQuestionExamVO;

public interface QuestionExamDao extends PagingAndSortingRepository<TeQuestionExamVO, Long>{
	List<TeQuestionExamVO> findByExampaperId(Long exampaperId);
	@Modifying
	@Delete("delete from TeQuestionExamVO where exampaperId=?1")
	Integer deleteByExampaperId(Long exampaperId);
}
