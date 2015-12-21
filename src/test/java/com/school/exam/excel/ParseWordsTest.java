package com.school.exam.excel;

import com.school.exam.entity.Course;
import com.school.exam.utils.ExcelUtils;
import jxl.read.biff.BiffException;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by baiqw on 15/11/20.
 */
public class ParseWordsTest {


    @Test
    public void testToList() throws IOException, BiffException {
        //创建输入流
        InputStream stream = ParseWordsTest.class.getClassLoader().getResourceAsStream("words.xls");

        List<List<String>> list = ExcelUtils.toList(stream);

        for(int i=0;i<list.size();i++){
            List<String> cells = list.get(i);
//            for (int  j = 1; j < cells.size(); j++){
                System.out.print(String.format("insert into t_te_words (type, word, remark) values ('%s', '%s', '%s');", "北校区大气PM2.5中多环芳烃分析", cells.get(1), cells.get(2))) ;
//            }
//
//            for(String cell:cells){
//                System.out.print(cell + "\t") ;
//            }

            System.out.println();
        }
    }
}
