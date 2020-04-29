package com.fastcook.dao;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Lob;


@Data
@Entity
public class Ingredient extends BaseEntity {
    private String name;
    private Integer quantity;
    private String unity;
    @Lob
    private String description;
}
