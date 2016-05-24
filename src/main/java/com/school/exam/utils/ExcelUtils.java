package com.school.exam.utils;

import com.school.exam.entity.*;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springside.modules.mapper.JsonMapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by baiqw on 15/11/20.
 */
public class ExcelUtils {
    private static final int SELECT_ITEM_START_INDEX = 5;
    public static final int ANSWER_TRUE = 1;
    public static final int ANSWER_FALSE = 0;
    private static Logger logger = LoggerFactory.getLogger(ExcelUtils.class);
    private static JsonMapper jsonMapper = new JsonMapper();

    public static Map<String, Course> toCourse(List<List<String>> courses){
        Map<String, Course> result = new LinkedHashMap<String,Course>();

        for (List<String> row: courses){
            //课程
            String title = row.get(0);
            Course course = result.get(title);
            if (null == course){
                course = new Course(title);
                result.put(row.get(0), course);
            }

            //任务
            title = row.get(1);
            CourseTask courseTask = course.getEntity(new CourseTask(title));

            //子任务
            title = row.get(2);
            CourseSubTask courseSubTask = courseTask.getEntity(new CourseSubTask(title));

            //步骤
            title = row.get(3);
            CourseSubStepTask courseSubStepTask = courseSubTask.getEntity(new CourseSubStepTask(title));


            //资源
            title = row.get(4);
            CourseResource courseResource =new CourseResource(title);
            courseSubStepTask.getResources().add(courseResource);

            courseResource.setContent(title);
            courseResource.setType(row.get(5));
            courseResource.setFile(row.get(6));
        }
        logger.debug("result:{}",jsonMapper.toJson(result));

        return result;
    }

    public static List<TeExamQuestionVO> toQuestion(Long projectId, List<List<String>> questions){
        List<TeExamQuestionVO> result = new ArrayList<TeExamQuestionVO>();

        TeProjectVO projectVO = new TeProjectVO();
        projectVO.setId(projectId);

        for (List<String> question: questions){
            TeExamQuestionVO teExamQuestionVO = new TeExamQuestionVO();
            teExamQuestionVO.setProject(projectVO);

            teExamQuestionVO.setQuestionCont(question.get(1));
            teExamQuestionVO.setState(1);
            teExamQuestionVO.setType("单选".equals(question.get(0))?1:2);
            teExamQuestionVO.setQuestionScore(Double.parseDouble(StringUtils.defaultString(question.get(2), "5")));

            List<String> answerIndex = CollectionUtils.arrayToList(question.get(4).split("/"));

            logger.debug("answerIndex:{}", answerIndex);

            int itemCount = Integer.parseInt(StringUtils.defaultString(question.get(3), (question.size() - SELECT_ITEM_START_INDEX) + ""));
            List<TeSelectItemsVO> selectItemsVOs = new ArrayList<TeSelectItemsVO>();
            for (int i = SELECT_ITEM_START_INDEX; i < SELECT_ITEM_START_INDEX + itemCount;i++){
                TeSelectItemsVO selectItemsVO = new TeSelectItemsVO();

                selectItemsVO.setQuestion(teExamQuestionVO);
                selectItemsVO.setSelectCont(question.get(i));
                selectItemsVO.setIsAnswer(answerIndex.contains((i-SELECT_ITEM_START_INDEX+1)+"")?ExcelUtils.ANSWER_TRUE:ExcelUtils.ANSWER_FALSE);

                logger.debug("selectItemsVO:{}", selectItemsVO);

                selectItemsVOs.add(selectItemsVO);
            }

            teExamQuestionVO.setSelectItems(selectItemsVOs);

            result.add(teExamQuestionVO);
        }

        return result;
    }

    public static List<List<String>> toList(InputStream stream){
        List<List<String>> result = new ArrayList<List<String>>();

        Workbook rwb = null;
        Cell cell = null;

        //获取Excel文件对象
        try {
            rwb = Workbook.getWorkbook(stream);

            //获取文件的指定工作表 默认的第一个
            Sheet sheet = rwb.getSheet(0);

            //行数(表头的目录不需要，从1开始)
            for(int i=1; i<sheet.getRows(); i++){
                //创建一个数组 用来存储每一列的值
                List<String> str = new ArrayList<String>(sheet.getColumns());

                if (StringUtils.isEmpty(sheet.getCell(0, i).getContents())){
                    break;
                }

                //列数
                for(int j=0; j<sheet.getColumns(); j++){
                    //获取第i行，第j列的值
                    cell = sheet.getCell(j,i);
                    str.add(cell.getContents());
                }
                //把刚获取的列存入list
                result.add(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (BiffException e) {
            e.printStackTrace();
        }finally {
            if(rwb != null) {
                rwb.close();
            }
        }

//        logger.debug("toList:{}", result);

        return result;
    }
}
