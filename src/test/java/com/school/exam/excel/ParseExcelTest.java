package com.school.exam.excel;

import com.google.gson.Gson;
import com.school.exam.utils.ExcelUtils;

import jxl.read.biff.BiffException;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by baiqw on 15/11/20.
 */
public class ParseExcelTest {

    @Test
    public void testToQuestion(){
        InputStream stream = ParseExcelTest.class.getClassLoader().getResourceAsStream("exam.xls");
        List<List<String>> list = ExcelUtils.toList(stream);

        Gson gson;

        ExcelUtils.toQuestion(1l, list);

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
