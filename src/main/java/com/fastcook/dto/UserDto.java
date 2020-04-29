package com.fastcook.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class UserDto {
    @NotNull
    @NotEmpty
    private String firstName;
    @NotNull
    @NotEmpty
    private String lastName;
    @NotNull
    @NotEmpty
    private String username;
    @NotNull
    @NotEmpty
    private String mail;
    @NotNull
    @NotEmpty
    private Date dateOfBirth;
    @NotNull
    @NotEmpty
    private String civility;
    @NotNull
    @NotEmpty
    private String phone;
}
