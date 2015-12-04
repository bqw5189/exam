package com.school.exam.entity;


import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 课程
 * Created by baiqw on 15/11/29.
 */
public class TitleEntity<T extends TitleEntity> {
    public TitleEntity(String title) {
        this.title = title;
    }

    private Map<String, T> subEntitys = new LinkedHashMap<String, T>();

    public T getEntity(T t){
        T s = subEntitys.get(t.getTitle());
        if (null == s){
            subEntitys.put(t.getTitle(), t);
            s = t;
        }
        return s;
    }

    public Map<String, T> getSubEntitys() {
        return subEntitys;
    }

    String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
