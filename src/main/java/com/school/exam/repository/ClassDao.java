package com.school.exam.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.school.exam.entity.SSClassVO;

public interface ClassDao extends PagingAndSortingRepository<SSClassVO, Long>, JpaSpecificationExecutor<SSClassVO>{
	public SSClassVO findByClassName(String className);
}
