package com.school.exam.repository;

import java.util.List;
import java.util.Map;

import com.school.exam.entity.IndexShowVO;

@MyBatisRepository
public interface IndexShowDao {
	//查找最新已排名人试卷统计
	public IndexShowVO findMaxId(); 
	public Double findSumScore(Long ids); 
	public Integer findPassNum(Map<String,Object> param);
	public Integer findTotalNum(Long id);
	public List<IndexShowVO> findFivePerson(Long id);
}
