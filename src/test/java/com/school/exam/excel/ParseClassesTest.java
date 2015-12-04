package com.school.exam.excel;

import com.school.exam.entity.Course;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.utils.ExcelUtils;
import jxl.read.biff.BiffException;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by baiqw on 15/11/20.
 */
public class ParseClassesTest {

    @Test
    public void testToQuestion(){
        InputStream stream = ParseClassesTest.class.getClassLoader().getResourceAsStream("classes.xls");

        List<List<String>> list = ExcelUtils.toList(stream);
//
        Map<String, Course> courses = ExcelUtils.toCourse(list);

//        Assert.assertEquals(questionExamVOs.size(), 10);
    }
//    @Test
    public void testToList() throws IOException, BiffException {
        //创建输入流
        InputStream stream = ParseClassesTest.class.getClassLoader().getResourceAsStream("classes.xls");

        List<List<String>> list = ExcelUtils.toList(stream);

        for(int i=0;i<list.size();i++){
            List<String> cells = list.get(i);
            for(String cell:cells){
                System.out.print(cell + "\t") ;
            }

            System.out.println();
        }
    }
}
