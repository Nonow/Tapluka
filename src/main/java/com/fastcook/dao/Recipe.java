package com.fastcook.dao;

import com.fastcook.dao.type.Category;
import com.fastcook.dao.type.Level;
import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Data
@Entity
public class Recipe extends BaseEntity {

    @ManyToOne
    private User user;
    private String title;
    private Integer durationOfPreparationInMinutes;
    private Integer durationOfCookingInMinutes;
    @Enumerated(EnumType.STRING)
    private Level level;
    private BigDecimal cost;
    private Integer numberOfParts;
    @Lob
    private String description;
    private BigDecimal averageScore;
    @OneToMany(orphanRemoval = true, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Score> score = new ArrayList<>();
    private Boolean published = true;
    @OneToOne(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private File file;
    @Enumerated(EnumType.STRING)
    private Category category;
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Ingredient> ingredients = new ArrayList<>();
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Preparation> preparations = new ArrayList<>();

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

    @PreRemove
    private void removeRecipeFromUser() {

    }



}
