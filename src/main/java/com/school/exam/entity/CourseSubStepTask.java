package com.school.exam.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 步骤
 * Created by baiqw on 15/11/29.
 */
public class CourseSubStepTask extends TitleEntity<CourseResource>{

    public CourseSubStepTask(String title) {
        super(title);
    }

    List<CourseResource> resources = new ArrayList<CourseResource>();

    public List<CourseResource> getResources() {
        return resources;
    }

    public void setResources(List<CourseResource> resources) {
        this.resources = resources;
    }
}
