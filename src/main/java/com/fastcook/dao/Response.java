package com.fastcook.dao;

import lombok.Data;

import javax.persistence.*;

/**
 * use like a comment in a conversation
 */
@Data
@Entity
public class Response extends BaseEntity{
    @Lob
    private String content;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private User user;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Conversation Conversation;
}
