/**
 * 
 */
package com.school.exam.repository;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeProjectVO;
import com.school.exam.entity.TeSelectItemsVO;
import com.school.exam.service.account.AccountService;
import com.school.exam.service.question.CourseService;

import com.google.common.collect.Lists;

/**
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@ActiveProfiles("test")
public class TestAddUser  {
	@Resource
	private AccountService accountService;
	@Resource
	private CourseService service;
	@Test
	public void testAddUserA() {
		/*User user = UserData.randomNewUser();
		Date currentTime = new Date();
		accountService.registerUser(user);
		int usersize = accountService.getAllUser().size();
		User u = accountService.getUser(Long.parseLong("1"));
		System.out.println(user.getName());
		System.out.println(usersize);
		System.out.println(u.getRegisterDate()+"====="+u.getLoginName());
		assertNotNull(user.getPassword());
		assertThat(user.getName()).isNotEmpty();
		assertThat(user.getPassword()).isNotNull();*/
	}
	@Test
	public void testAddQuestion(){
		TeExamQuestionVO vo = new TeExamQuestionVO();
		vo.setId(110L);
		TeProjectVO pvo = new TeProjectVO();
		pvo.setId(10003L);
		vo.setProject(pvo);
		vo.setQuestionAnswerId(1000+"");
		vo.setQuestionCont("aaa");
		vo.setQuestionScore(10.0);
		vo.setType(1);
		List<TeSelectItemsVO> list = Lists.newArrayList();
		TeSelectItemsVO svo = new TeSelectItemsVO();
		svo.setId(1000L);
		svo.setIsAnswer(1);
		svo.setQuestion(vo);
		svo.setSelectCont("111");
		TeSelectItemsVO svo1 = new TeSelectItemsVO();
		svo1.setId(1001L);
		svo1.setIsAnswer(0);
		svo1.setQuestion(vo);
		svo1.setSelectCont("222");
		list.add(svo);
		list.add(svo1);
		//vo.setSelectItems(list);
		List<TeSelectItemsVO> items = service.saveSelectItems(list);
		vo.setSelectItems(items);
		//vo.addSelectItem(svo1);
		//service.saveQuestion(vo);
	}

}
