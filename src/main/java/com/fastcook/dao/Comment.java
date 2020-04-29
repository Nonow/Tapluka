package com.fastcook.dao;

import lombok.Data;

import javax.persistence.*;
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
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User user;
    //TODO
//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    private Publication publication;
}
