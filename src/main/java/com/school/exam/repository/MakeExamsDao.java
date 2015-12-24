package com.school.exam.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.school.exam.entity.TeMakeExamVO;

public interface MakeExamsDao extends PagingAndSortingRepository<TeMakeExamVO, Long>, JpaSpecificationExecutor<TeMakeExamVO>{
	@Modifying
	@Query("update TeMakeExamVO set state=?2,examBeginDate=?3 where id=?1")
	public int updateMakeExamStart(Long id,Integer state,Timestamp beginDate);
	@Modifying
	@Query("update TeMakeExamVO set state=?2,examEndDate=?3 where id=?1")
	public int updateMakeExamEnd(Long id,Integer state,Timestamp endDate);
	@Modifying
	@Query("update TeMakeExamVO set state=?2 where id=?1")
	public int updateStateById(Long examId,Integer state);
	@Modifying
	@Query("select new com.school.exam.entity.TeMakeExamVO(t.id,t.examName,t.examTime,t.examRemark) from TeMakeExamVO t where t.state=?1 ORDER BY t.id desc")
	public List<TeMakeExamVO> queryBeforeFiveExam(Integer state);

    List<TeMakeExamVO> findTop1ByProjectProjectNameOrderByIdDesc(String examName);
}
