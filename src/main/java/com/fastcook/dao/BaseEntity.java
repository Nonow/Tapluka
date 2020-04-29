package com.fastcook.dao;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.PastOrPresent;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@MappedSuperclass
@Data
public abstract class BaseEntity {
    private static final DateTimeFormatter FRENCH_DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("EEEE dd MMMM yyyy HH:mm:ss").withLocale(Locale.FRENCH);
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected Long id;
    @Version
    protected Integer version;
    @PastOrPresent
    private LocalDateTime createdOn;
    @PastOrPresent
    private LocalDateTime updatedOn;
    private String createDate;
    private String updateDate;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
        createDate = createdOn.format(FRENCH_DATE_TIME_FORMATTER);
        preUpdate();
    }

    @PreUpdate
    public void preUpdate() {
        updatedOn = LocalDateTime.now();
        updateDate = updatedOn.format(FRENCH_DATE_TIME_FORMATTER);
    }

}
