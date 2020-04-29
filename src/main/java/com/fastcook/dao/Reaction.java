package com.fastcook.dao;

import com.fastcook.dao.type.ReactionType;
import lombok.Data;

import javax.persistence.*;


@Data
@Entity
public class Reaction extends BaseEntity {
    @Enumerated(EnumType.STRING)
    private ReactionType reactionType;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User user;
    @Lob
    private String content;
}
