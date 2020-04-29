package com.fastcook.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class SubjectOfConversationDto {

    private Long updateId;

    @NotEmpty
    @NotNull
    private String title2;
    @NotEmpty
    @NotNull
    private String description2;
    @NotNull
    private CommonsMultipartFile file2;
}
