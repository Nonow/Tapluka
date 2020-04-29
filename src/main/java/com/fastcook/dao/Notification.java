package com.fastcook.dao;

import com.fastcook.dao.type.NotificationType;
import lombok.Data;

import javax.persistence.*;


@Data
@Entity
public class Notification extends BaseEntity {
    @ManyToOne
    private User user;
    private String title;
    @Lob
    private String content;
    @Enumerated(EnumType.STRING)
    private NotificationType notificationType;

    public Notification(String title, String content, NotificationType notificationType) {
        this.title = title;
        this.content = content;
        this.notificationType = notificationType;
    }
}
