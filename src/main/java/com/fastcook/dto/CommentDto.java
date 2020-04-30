package com.fastcook.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class CommentDto {

    @NotNull
    private Long publicationId;

    @NotNull
    @NotEmpty
    private String content;
}
