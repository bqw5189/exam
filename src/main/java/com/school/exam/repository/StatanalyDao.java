package com.school.exam.repository;

import java.util.List;
import java.util.Map;

@MyBatisRepository
public interface StatanalyDao {
	List statanalyQueryByExamId(Long examId);
	List statanalyDetailById(Map param);
}
