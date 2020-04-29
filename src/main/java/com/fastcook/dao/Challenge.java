package com.fastcook.dao;

import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class Challenge extends BaseEntity {
    @ManyToOne
    private User user;
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<User> participants = new ArrayList<>();
    private String title;
    @Lob
    private String description;
    private BigDecimal averageScore;
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Score> score = new ArrayList<>();
    @OneToOne(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private File file;

    @PreUpdate
    @Override
    public void preUpdate() {
        super.preUpdate();
        double average = 0;
        try {
            average = score.stream().mapToDouble(score -> score.getScore().doubleValue()).average().getAsDouble();
        } catch (Exception e) {
            //e.printStackTrace();
        }
        averageScore = new BigDecimal(String.valueOf(average));
    }
}
