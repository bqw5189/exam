package com.school.exam.service.account;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.internal.util.collections.CollectionHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.school.exam.entity.IndexShowVO;
import com.school.exam.entity.TeMakeExamVO;
import com.school.exam.repository.IndexShowDao;
import com.school.exam.repository.MakeExamsDao;

@Component
@Transactional
public class IndexService {
	private IndexShowDao indexdao;
	private MakeExamsDao examdao;
	public IndexShowVO getIndexShowVo(Long id){
		IndexShowVO vo = null;
		if(null==id){
			vo = indexdao.findMaxId();
		}else{
			vo = new IndexShowVO();
			TeMakeExamVO examvo = examdao.findOne(id);
			vo.setId(id);
			vo.setExamName(examvo.getExamName());
		}
		Double totalScore = 0.00;
		Integer totalnum = 0;
		String scale = "0.0";
		if(null==vo){
			vo = new IndexShowVO(); 
		}else{
			totalScore = indexdao.findSumScore(vo.getId());
			totalnum = indexdao.findTotalNum(vo.getId());
			Map<String,Object> param = new HashMap();
			param.put("id", vo.getId());
			param.put("score",totalScore);
			Integer passnum = indexdao.findPassNum(param);
			DecimalFormat df = new DecimalFormat(".##");
			scale = df.format(passnum/totalnum.doubleValue());
		}
		vo.setPersonNum(totalnum);
		vo.setScale(Double.valueOf(scale));
		vo.setSumScore(totalScore);
		return vo;
	}
	/**
	 * 查询前五个最新完成的试卷信息
	 * @return
	 */
	public List<TeMakeExamVO> getBeforeFiveExam(){
		List<TeMakeExamVO> list = examdao.queryBeforeFiveExam(3);
		List<TeMakeExamVO> showList = new ArrayList<TeMakeExamVO>();
		for(int i=0;i<(list.size()>10?10:list.size());i++){
			showList.add(list.get(i));
		}
		return showList;
	}
	public List<IndexShowVO> getListById(Long id){
		return indexdao.findFivePerson(id);
	}
	public IndexShowDao getIndexdao() {
		return indexdao;
	}
	@Autowired
	public void setIndexdao(IndexShowDao indexdao) {
		this.indexdao = indexdao;
	}
	public MakeExamsDao getExamdao() {
		return examdao;
	}
	@Autowired
	public void setExamdao(MakeExamsDao examdao) {
		this.examdao = examdao;
	}
	
}
