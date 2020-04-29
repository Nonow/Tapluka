package com.fastcook.dao;

import lombok.Data;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Lob;
import java.util.ArrayList;
import java.util.List;


@Data
@Entity
public class Preparation extends BaseEntity{
    private Integer number;
    private Integer duration;
    @ElementCollection
    private List<String> tools = new ArrayList<>();
    @Lob
    private String description;
}
