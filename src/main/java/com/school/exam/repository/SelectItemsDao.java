package com.school.exam.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeSelectItemsVO;
public interface SelectItemsDao extends PagingAndSortingRepository<TeSelectItemsVO, Long>, JpaSpecificationExecutor<TeSelectItemsVO> {
	@Modifying
	@Query("delete from TeSelectItemsVO item where item.question.id=?1")
	public Integer deleteByDepdId(Long id);
}
