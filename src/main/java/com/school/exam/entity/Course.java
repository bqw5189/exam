package com.school.exam.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 课程
 * Created by baiqw on 15/11/29.
 */
public class Course extends  TitleEntity<CourseTask> {

    public Course(String title) {
        super(title);
    }

}
