package com.fastcook.dao;

import lombok.Data;

import javax.persistence.Entity;


@Data
@Entity
public class Score extends BaseEntity {
    private Integer score;
}
