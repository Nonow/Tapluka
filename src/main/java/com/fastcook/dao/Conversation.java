package com.fastcook.dao;

import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class Conversation extends BaseEntity {
    @ManyToOne
    private User user;
    private String title;
    @Lob
    private String content;
    @OneToMany(orphanRemoval = true, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Reaction> reactions = new ArrayList<>();
    @OneToOne(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private File file;

    @ManyToMany(cascade = CascadeType.REMOVE)
    @LazyCollection(LazyCollectionOption.TRUE)
    @JoinTable(name = "conversation_comment",
            joinColumns = @JoinColumn(name="conversation_id"),
            inverseJoinColumns = @JoinColumn(name="comment_id"))
    private List<Comment> comments = new ArrayList<>();
}
