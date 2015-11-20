package com.school.exam.service.makexam;

import java.sql.Timestamp;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.school.exam.repository.MakeExamsDao;

@Component
@Transactional
public class MakexamService {
	private MakeExamsDao examdao;
	
	public int updateState(Long id,Integer state){
		String data = DateFormatUtils.format(System.currentTimeMillis(), "yyyy-MM-dd hh:mm:ss");
		if(state.equals(1)){
			return examdao.updateMakeExamStart(id, state,Timestamp.valueOf(data));
		}else{
			return examdao.updateMakeExamEnd(id, state,Timestamp.valueOf(data));
		}
	}
	public MakeExamsDao getExamdao() {
		return examdao;
	}
	@Autowired
	public void setExamdao(MakeExamsDao examdao) {
		this.examdao = examdao;
	}
	
}
