package com.school.exam.service.statanaly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.school.exam.entity.StatanalyViewVO;
import com.school.exam.repository.StatanalyDao;

@Transactional
@Component
public class StatanalyService {
	private StatanalyDao statanalyDao;
	public List<StatanalyViewVO> satatanalyQuery(Long examId){
		return statanalyDao.statanalyQueryByExamId(examId);
	}
	public List<StatanalyViewVO> satatanalyDetail(Long id,Long examId){
		Map<String, Long> param = new HashMap();
		param.put("id", id);
		param.put("examId",examId);
		return statanalyDao.statanalyDetailById(param);
	}
	public StatanalyDao getStatanalyDao() {
		return statanalyDao;
	}
	@Autowired
	public void setStatanalyDao(StatanalyDao statanalyDao) {
		this.statanalyDao = statanalyDao;
	}
	
}
