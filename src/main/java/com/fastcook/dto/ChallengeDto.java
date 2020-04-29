package com.fastcook.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

@Data
public class ChallengeDto {

    @NotEmpty
    @NotNull
    private String title;
    @NotEmpty
    @NotNull
    private String description;

    private CommonsMultipartFile file;
}
