package com.school.exam.entity;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by baiqw on 15/11/20.
 */
public class FileUploadForm {
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
