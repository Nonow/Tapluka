package com.fastcook.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class AuthenticationDto {
    @Email
    @NotNull
    @NotEmpty
    private String mail;
    @NotNull
    @NotEmpty
    private String password;
}
