package com.school.exam.excel;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.school.exam.entity.TeExamQuestionVO;
import com.school.exam.entity.TeQuestionExamVO;
import com.school.exam.utils.ExcelUtils;

import jxl.read.biff.BiffException;
import org.eclipse.jetty.util.ajax.JSON;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by baiqw on 15/11/20.
 */
public class ParseExcelTest {
    public static List<List<String>> RESOURCES = new ArrayList<List<String>>();

    @Test
    public void testClassProject(){
        InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("classes.xls");
        RESOURCES.addAll(ExcelUtils.toList(inputStream));
        System.out.println(JSON.toString(ExcelUtils.toCourse(RESOURCES)));
    }
    public void testToQuestion(){
        InputStream stream = ParseExcelTest.class.getClassLoader().getResourceAsStream("exam.xls");
        List<List<String>> list = ExcelUtils.toList(stream);

        List<TeExamQuestionVO> questionExamVOs = ExcelUtils.toQuestion(200l, list);

        Assert.assertEquals(questionExamVOs.size(), 10);
    }
//    @Test
    public void testToList() throws IOException, BiffException {
        //创建输入流
        InputStream stream = ParseExcelTest.class.getClassLoader().getResourceAsStream("exam.xls");

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
