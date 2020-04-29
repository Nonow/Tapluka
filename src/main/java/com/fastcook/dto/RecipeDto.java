package com.fastcook.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


@Data
public class RecipeDto {

    private Long updateId;

    @NotNull
    @NotEmpty
    private String title3;
    @NotNull
    private CommonsMultipartFile file3;
    @NotNull
    @NotEmpty
    private String category;
    @NotNull
    private Integer numberOfParts;
    @NotNull
    @NotEmpty
    private String description3;
    @NotNull
    private Integer durePrep;
    @NotNull
    private Integer dureCuis;
}
