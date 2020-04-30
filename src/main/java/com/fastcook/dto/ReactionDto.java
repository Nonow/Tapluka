package com.fastcook.dto;

import com.fastcook.dao.type.ReactionType;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class ReactionDto {

    private Long objectId;

    @NotNull
    private Integer reactionType;
}
