package com.school.exam.entity;

import java.util.List;

/**
 * 课程
 * Created by baiqw on 15/11/29.
 */
public class CourseResource extends  TitleEntity<TitleEntity> {
    public CourseResource(String title) {
        super(title);
    }

    /**
     * 内容
     */
    private String content;
    /**
     * 类型
     */
    private String type;
    /**
     * 文件
     */
    private String file;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFile() {

        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
}
