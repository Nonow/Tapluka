package com.fastcook.dto;

import com.fastcook.dao.Notification;
import lombok.Data;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class NotificationDto {


    public NotificationDto(String title, String content) {
        this.title = title;
        this.content = content;
    }

    private Long id;
    @NotNull
    private String title;
    @NotNull
    private String content;
}
