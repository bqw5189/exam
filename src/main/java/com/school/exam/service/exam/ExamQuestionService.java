package com.school.exam.service.exam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeExamResultVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.entity.TeQuestionExamVO;
import com.school.exam.repository.CountQuestionDao;
import com.school.exam.repository.ExamQuestionDao;
import com.school.exam.repository.ExamResultDao;
import com.school.exam.repository.MakeExamsDao;
import com.school.exam.repository.QuestionExamDao;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.Hibernates;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

import com.google.common.collect.Lists;
@Component
@Transactional
public class ExamQuestionService {
	private ExamQuestionDao questionDao;
	private MakeExamsDao examDao; 
	private ExamResultDao resultDao;
	private QuestionExamDao questionExamDao;
	private CountQuestionDao countDao;
	/**
	 * 查询所有试卷
	 * @return
	 */
	public List<TeMakeExamVO> findAll(){
		SearchFilter filter = new SearchFilter("state", Operator.EQ, "1");
		return examDao.findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter), TeMakeExamVO.class));
	}
	/**
	 * 删除试卷通过试卷ID
	 * @param id
	 */
	public void deleteMakeExam(Long id){
		examDao.delete(id);
		questionExamDao.deleteByExampaperId(id);
	}
	/**
	 * 保存试卷信息
	 * @param vo
	 */
	public void saveMakeExam(TeMakeExamVO vo,String [] ids){
		if(null==vo.getId()){
			vo = examDao.save(vo);
			for(String id:ids){
				if(StringUtils.isNotEmpty(id)){
					TeQuestionExamVO qevo = new TeQuestionExamVO(); 
					qevo.setExampaperId(vo.getId());
					qevo.setQuestionId(Long.parseLong(id));
					questionExamDao.save(qevo);
				}
			}
		}else{
			updateMakeExam(vo,ids);
		}
	}
	/**
	 * 更新试卷信息
	 * @param vo
	 */
	public void updateMakeExam(TeMakeExamVO vo,String [] ids){
		vo = examDao.save(vo);
		deleteQuestionExam(vo.getId());
		for(String id:ids){
			TeQuestionExamVO qevo = new TeQuestionExamVO(); 
			qevo.setExampaperId(vo.getId());
			qevo.setQuestionId(Long.parseLong(id));
			questionExamDao.save(qevo);
		}
	}
	/**
	 * 删除试卷信息
	 * @param vo
	 */
	public void deleteQuestionExam(Long examId){
		if(null!=examId){
		List<TeQuestionExamVO> list = questionExamDao.findByExampaperId(examId);
			questionExamDao.delete(list);
		}
	}
	/**
	 * 通过ID查找试卷
	 * @param id
	 * @return
	 */
	public TeMakeExamVO findById(Long id){
		TeMakeExamVO vo = examDao.findOne(id);
		if (vo != null) {
			Hibernates.initLazyProperty(vo.getQuestionList());
			Hibernates.initLazyProperty(vo.getProject());
		}
		return vo;
	}

    public TeExamQuestionVO getQuestionById(Long id){
        return questionDao.findOne(id);
    }
    public void saveQuestion(TeExamQuestionVO vo){
        questionDao.save(vo);
    }
	/**
	 * 通过项目ID查询试卷
	 * @param projectId
	 * @param searchParams
	 * @param pageNumber
	 * @param pageSize
	 * @param sortType
	 * @return
	 */
	public List<TeMakeExamVO> findAllMakeExamByProjectId(Long projectId,SearchFilter filter,Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = getPageRequest(pageNumber, pageSize, sortType);
		Specification<TeMakeExamVO> spec = buildSearch(projectId,filter,searchParams);
		return examDao.findAll(spec,new Sort(Direction.DESC, "id"));
		
		//return examDao.findAll(spec, pageRequest);
	}
	
	/**
	 * 创建分页请求.
	 */
	private PageRequest getPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = new Sort(Direction.DESC, "id");
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("state".equals(sortType)) {
			sort = new Sort(Direction.ASC, "state");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}
	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<TeMakeExamVO> buildSearch(Long projectId,SearchFilter filter,Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		if(null!=projectId){
			filters.put("project.id", new SearchFilter("project.id", Operator.EQ, projectId));
		}
		filters.put("state", filter);
		Specification<TeMakeExamVO> spec = DynamicSpecifications.bySearchFilter(filters.values(), TeMakeExamVO.class);
		return spec;
	}
	
	/**
	 * 通过项目ID获取所以试题
	 * @param projectId
	 * @return
	 */
	public List<TeExamQuestionVO> findAllQuestionByProjectId(Long projectId,Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<TeExamQuestionVO> spec = buildSpecification(projectId,searchParams);
		return questionDao.findAll(spec);
	}
    /**
     * 通过项目ID获取试题
     * @param projectId
     * @return
     */
    public Page<TeExamQuestionVO> findByProjectId(Long projectId,Map<String, Object> searchParams, int pageNumber, int pageSize,
                                                  String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<TeExamQuestionVO> spec = buildSpecification(projectId,searchParams);
        //return questionDao.findAll(spec);
        return questionDao.findAll(spec, pageRequest);
    }
    /**
	 * 项目ID
	 * @param projectId
	 * @return
	 */
	public List<TeExamQuestionVO> findValidQuestionByProjectId(Long projectId){
		return countDao.findValidQuestionByProjectId(projectId);
	}
	public List<TeExamQuestionVO> findByids(String ids){
		if(StringUtils.isNotEmpty(ids)&&!ids.equals("null")){
			String[] questionIds = ids.substring(0, ids.length()-1).split(",");
			List<Long> list = Lists.newArrayList();
			for(int i=0;i<questionIds.length;i++){
				list.add(Long.parseLong(questionIds[i]));
			}
			return (List<TeExamQuestionVO>) questionDao.findAll(list);
		}else{
			List<TeExamQuestionVO> list = Lists.newArrayList();
			return list; 
		}
	}
	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("type".equals(sortType)) {
			sort = new Sort(Direction.ASC, "type");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<TeExamQuestionVO> buildSpecification(Long projectId,Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		if(null!=projectId){
			filters.put("project.id", new SearchFilter("project.id", Operator.EQ, projectId));
		}
		Specification<TeExamQuestionVO> spec = DynamicSpecifications.bySearchFilter(filters.values(), TeExamQuestionVO.class);
		return spec;
	}
	/**
	 * 统计试卷各题型个数
	 * @param type 1:单选2：多选
	 * @param questionID 试卷ID
	 * @return
	 */
	public Long getTypeNumber(Integer type,Long exampaperId){
		/*Map<String, Object> param = new HashMap();
		param.put("type", type);
		param.put("questionId",questionId);*/
//		SearchFilter filter = new SearchFilter("type", Operator.EQ, type);
//		SearchFilter filter2 = new SearchFilter("questionId", Operator.EQ, questionId);
//		return questionDao.count(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter,filter2), TeExamQuestionVO.class));
		//return  questionDao.findCountBytype(type,questionId);
		Map param = new HashMap();
		param.put("type", type);
		param.put("exampaperId", exampaperId);
		return countDao.findCountBytype(param);
	}
	/**
	 * 级联查询
	 * @param id
	 * @return
	 */
	public TeMakeExamVO findExamQuestions(Long id){
		TeMakeExamVO vo = examDao.findOne(id);
		if (vo != null) {
			Hibernates.initLazyProperty(vo.getQuestionList());
		}
		List<TeExamQuestionVO> list = vo.getQuestionList();
		if(null!=list&&list.size()>0){
			for(TeExamQuestionVO qvo:list){
				Hibernates.initLazyProperty(qvo.getSelectItems());
			}
		}
		return vo;
	}
	/**
	 * 保存考试结果表
	 * @param rList
	 */
	public void saveExamResult(List<TeExamResultVO> rList){
		resultDao.save(rList);
	}
	
	public List<TeExamResultVO> findByDepdIdAndPersonId(Long depdId,Long personId){
		SearchFilter filter = new SearchFilter("depdId", Operator.EQ, depdId);
		SearchFilter filter2 = new SearchFilter("personId", Operator.EQ, personId);
		return resultDao.findAll(DynamicSpecifications.bySearchFilter(Lists.newArrayList(filter,filter2), TeExamResultVO.class));
	}

	public ExamQuestionDao getQuestionDao() {
		return questionDao;
	}
	@Autowired
	public void setQuestionDao(ExamQuestionDao questionDao) {
		this.questionDao = questionDao;
	}
	public MakeExamsDao getExamDao() {
		return examDao;
	}
	@Autowired
	public void setExamDao(MakeExamsDao examDao) {
		this.examDao = examDao;
	}
	public ExamResultDao getResultDao() {
		return resultDao;
	}
	@Autowired
	public void setResultDao(ExamResultDao resultDao) {
		this.resultDao = resultDao;
	}
	public QuestionExamDao getQuestionExamDao() {
		return questionExamDao;
	}
	@Autowired
	public void setQuestionExamDao(QuestionExamDao questionExamDao) {
		this.questionExamDao = questionExamDao;
	}
	public CountQuestionDao getCountDao() {
		return countDao;
	}
	@Autowired
	public void setCountDao(CountQuestionDao countDao) {
		this.countDao = countDao;
	}


    public List<TeMakeExamVO> findByExamName(String examName) {
        return examDao.findTop1ByProjectProjectNameOrderByIdDesc(examName);
    }
}
