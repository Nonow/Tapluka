package com.fastcook.dao;

import lombok.Data;

import javax.persistence.*;
import javax.security.auth.Subject;
import java.util.ArrayList;
import java.util.List;


/**
 * use for Publication
 */
@Data
@Entity
public class Comment extends BaseEntity{
    @Lob
    private String content;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private User user;
    //TODO
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinTable(name = "publication_comment",
            joinColumns = @JoinColumn(name="comment_id"),
            inverseJoinColumns = @JoinColumn(name="publication_id"))
    private List<Publication> publications = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinTable(name = "conversation_comment",
                joinColumns = @JoinColumn(name="comment_id"),
                inverseJoinColumns = @JoinColumn(name ="conversation_id"))
    private List<Conversation> subjects = new ArrayList<>();
}
