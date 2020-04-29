package com.fastcook.dao;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Lob;


@Data
@Entity
public class File extends BaseEntity {

    @Lob
    private String imageInBase64;
    private String mimeType;
}
