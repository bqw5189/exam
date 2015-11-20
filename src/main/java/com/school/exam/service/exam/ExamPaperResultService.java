package com.school.exam.service.exam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.school.exam.entity.TeExamPaperResultVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.repository.ExamPaperResultDao;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

import com.google.common.collect.Lists;

@Component
@Transactional
public class ExamPaperResultService {
	private ExamPaperResultDao resultDao;

	public ExamPaperResultDao getResultDao() {
		return resultDao;
	}
	@Autowired
	public void setResultDao(ExamPaperResultDao resultDao) {
		this.resultDao = resultDao;
	}
	public void saveExamPaperResult(TeExamPaperResultVO vo){
		resultDao.save(vo);
	}
	public Integer hasExamPaperByPersonId(Long personId,Long examId){
		SearchFilter filter = new SearchFilter("personId", Operator.EQ, personId);
		SearchFilter filter2 = new SearchFilter("examId", Operator.EQ, examId);
		List<TeExamPaperResultVO> relist = resultDao.findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter,filter2), TeExamPaperResultVO.class));
		return null==relist?0:relist.size();
	}
	public List<TeExamPaperResultVO> getExamPaperByPersonId(Long personId,Long examId){
		SearchFilter filter = new SearchFilter("personId", Operator.EQ, personId);
		SearchFilter filter2 = new SearchFilter("examId", Operator.EQ, examId);
		return resultDao.findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter,filter2), TeExamPaperResultVO.class));
	}
	/**
	 * 判断用户是否已经考过此试卷
	 * @param userId
	 * @param examId
	 * @return
	 */
	public boolean isHasExamByCurrentUserId(Long userId,Long examId){
		TeExamPaperResultVO vo = resultDao.findByPersonIdAndExamId(userId,examId);
		return (null==vo||null==vo.getId())?false:true;
	}
}
