package com.school.exam.repository;

import java.util.List;
import java.util.Map;

import com.school.exam.entity.TeExamQuestionVO;

@MyBatisRepository
public interface CountQuestionDao {
	public Long findCountBytype(Map param);
	public List<TeExamQuestionVO> findValidQuestionByProjectId(Long projectId);
}
