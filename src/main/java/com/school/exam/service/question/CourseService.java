package com.school.exam.service.question;


import java.io.InputStream;
import java.util.List;

import com.school.exam.utils.ExcelUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeSelectItemsVO;
import com.school.exam.repository.CourseDao;
import com.school.exam.repository.ExamQuestionDao;
import com.school.exam.repository.ProjectDao;
import com.school.exam.repository.SelectItemsDao;
import org.springside.modules.persistence.Hibernates;

import com.google.common.collect.Lists;
@Component
@Transactional
public class CourseService {
	private CourseDao courseDao;
	private ExamQuestionDao questionDao;
	private SelectItemsDao selectItemDao;

    public boolean inputQuestion(Long projectId, InputStream source){

        List<List<String>> questionList = ExcelUtils.toList(source);

        List<TeExamQuestionVO> questionVOList = ExcelUtils.toQuestion(projectId, questionList);

        questionDao.save(questionVOList);

        for (TeExamQuestionVO examQuestionVO: questionVOList){
            String answerIds = getAswerIds(examQuestionVO.getSelectItems());
            examQuestionVO.setQuestionAnswerId(answerIds);
            questionDao.save(examQuestionVO);
        }

        return true;
    }
    /**
     * 是否可以删除试题信息
     * @param id
     * @return
     */
    public boolean isNotDeleteQuestion(Long id){
    	Integer count = questionDao.findByProjectId(id);
    	if(count>0){
    		return false;
    	}else{
    		return true;
    	}
    }
    private String getAswerIds(List<TeSelectItemsVO> selectItems) {
        String result = "";

        for (TeSelectItemsVO selectItemsVO: selectItems){
            if (selectItemsVO.getIsAnswer() == ExcelUtils.ANSWER_TRUE) {
                if (StringUtils.isEmpty(result)) {
                    result += selectItemsVO.getId();
                }else{
                    result += "," + selectItemsVO.getId();
                }
            }
        }

        return result;
    }
	
	/**
	 * 获得所有课程及项目信息
	 * @return
	 */
	public List<TeCourseVO> findAllCourse(){
		List<TeCourseVO> list = (List<TeCourseVO>) courseDao.findAll();
		if(null!=list&&list.size()>0){
			for(TeCourseVO qvo:list){
				Hibernates.initLazyProperty(qvo.getProject());
			}
		}
		return list;
	}
	
	public SelectItemsDao getSelectItemDao() {
		return selectItemDao;
	}
	@Autowired
	public void setSelectItemDao(SelectItemsDao selectItemDao) {
		this.selectItemDao = selectItemDao;
	}

	/**
	 * 删除问题通过ID
	 * @param id
	 */
	public void deleteQuestionById(Long id){
		questionDao.delete(id); 
		selectItemDao.deleteByDepdId(id);
	}
	/**
	 * 保存问题
	 * @param vo
	 */
	public TeExamQuestionVO saveQuestion(TeExamQuestionVO vo){
		//List<TeSelectItemsVO> itemList = vo.getSelectItems();
		vo.setState(1);
		vo = questionDao.save(vo);
//		StringBuffer answers = new StringBuffer();
//		for(TeSelectItemsVO ivo:itemList){
//			ivo.setQuestion(vo);
//			TeSelectItemsVO returnvo = selectItemDao.save(ivo);
//			if(returnvo.getIsAnswer().equals(1)){
//				answers.append(returnvo.getId()+",");
//			}
//		}
//		if(null!=answers&&answers.length()>0){
//			questionDao.updateQuestion(answers.toString().substring(0, answers.length()-1),vo.getId());
//		}
		return vo;
	}
	public TeSelectItemsVO saveItem(TeSelectItemsVO item){
		TeSelectItemsVO tsv = selectItemDao.save(item);
		TeExamQuestionVO question = item.getQuestion();
		if(item.getIsAnswer().equals(1)){
			if(null!=question.getQuestionAnswerId()){
			question.setQuestionAnswerId(question.getQuestionAnswerId()+","+String.valueOf(item.getId()));
			}else{
				question.setQuestionAnswerId(String.valueOf(item.getId()));
			}
			//courseService.saveQuestion(question);
		}
		questionDao.save(question);
		return tsv;
	}
	/**
	 * 保存选项数据
	 * @param items
	 * @return
	 */
	public List<TeSelectItemsVO> saveSelectItems(List<TeSelectItemsVO> items){
		return Lists.newArrayList(selectItemDao.save(items));
	}
	/**
	 * 通过ID获取问题内容
	 * @param id
	 * @return
	 */
	public TeExamQuestionVO getQuestion(Long id){
		TeExamQuestionVO vo = questionDao.findOne(id);
		if(null!=vo){
		Hibernates.initLazyProperty(vo.getSelectItems());
		}
		return vo;
	}
	public CourseDao getCourseDao() {
		return courseDao;
	}
	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	public ExamQuestionDao getQuestionDao() {
		return questionDao;
	}
	@Autowired
	public void setQuestionDao(ExamQuestionDao questionDao) {
		this.questionDao = questionDao;
	}
	
	
}
