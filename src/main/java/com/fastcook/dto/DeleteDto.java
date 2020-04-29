package com.fastcook.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class DeleteDto {
    @NotNull
    private Long deleteId;
}
