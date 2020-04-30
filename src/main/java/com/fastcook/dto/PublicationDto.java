package com.fastcook.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class PublicationDto {

    private Long updateId;

    @NotEmpty
    @NotNull
    private String content;

    private CommonsMultipartFile file;
}
