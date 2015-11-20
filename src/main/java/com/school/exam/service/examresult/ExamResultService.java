package com.school.exam.service.examresult;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.school.exam.entity.TeExamPaperResultVO;
import com.school.exam.repository.ExamPaperResultDao;
import com.school.exam.repository.MakeExamsDao;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

import com.google.common.collect.Lists;

@Component
@Transactional
public class ExamResultService {
	private ExamPaperResultDao resultdao;

	public ExamPaperResultDao getResultdao() {
		return resultdao;
	}
	@Autowired
	public void setResultdao(ExamPaperResultDao resultdao) {
		this.resultdao = resultdao;
	}
	private MakeExamsDao examDao;
	
	public MakeExamsDao getExamDao() {
		return examDao;
	}
	@Autowired
	public void setExamDao(MakeExamsDao examDao) {
		this.examDao = examDao;
	}
	/**
	 * 获取排名列表
	 * @param examId
	 * @return
	 */
	public List<TeExamPaperResultVO> getListOrderbySumScore(Long examId){
		SearchFilter filter = new SearchFilter("examId", Operator.EQ, examId);
		return resultdao.findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter), TeExamPaperResultVO.class));
	}
	/**
	 * 更新排名
	 * @param list
	 */
	public void updateOrder(List<TeExamPaperResultVO> list,Long examId){
		resultdao.save(list);
		examDao.updateStateById(examId,3);
		
	}
	public List<TeExamPaperResultVO> getExamResult(Long id,Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType){
		PageRequest pageRequest = getPageRequest(pageNumber, pageSize, sortType);
		Specification<TeExamPaperResultVO> spec = buildSearch(id,searchParams);
		return resultdao.findAll(spec);
		//return resultdao.findAll(spec, pageRequest);
	}
	/**
	 * 创建分页请求.
	 */
	private PageRequest getPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.ASC, "personName");
		} else if ("sumScore".equals(sortType)) {
			sort = new Sort(Direction.DESC, "sumScore");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<TeExamPaperResultVO> buildSearch(Long examId,Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		if(null!=examId){
			filters.put("examId", new SearchFilter("examId", Operator.EQ, examId));
		}
		Specification<TeExamPaperResultVO> spec = DynamicSpecifications.bySearchFilter(filters.values(), TeExamPaperResultVO.class);
		return spec;
	}
}
