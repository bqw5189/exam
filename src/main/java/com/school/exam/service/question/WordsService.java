package com.school.exam.service.question;


import com.google.common.collect.Lists;
import com.school.exam.entity.TeCourseVO;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeSelectItemsVO;
import com.school.exam.entity.Words;
import com.school.exam.repository.CourseDao;
import com.school.exam.repository.ExamQuestionDao;
import com.school.exam.repository.SelectItemsDao;
import com.school.exam.repository.WordsDao;
import com.school.exam.utils.ExcelUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.Hibernates;

import java.io.InputStream;
import java.util.List;

@Component
@Transactional
public class WordsService {
    @Autowired
	private WordsDao wordsDao;
	
	public List<Words> findAll() {
        List<Words> list = (List<Words>) wordsDao.findAll();
        return list;
    }
}
