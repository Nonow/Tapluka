package com.fastcook.dao;

import com.fastcook.dao.type.Civility;
import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Past;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class User extends BaseEntity {

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Enumerated(EnumType.STRING)
    private Civility civility;
    @Column(unique = true)
    private String username;
    private String password;
    @OneToOne(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private File avatar;
    private String firstName;
    private String lastName;
    @Email
    @Column(unique = true)
    private String email;
    @Past
    private LocalDate dateOfBirth;
    private String dateOfBirthInString;
    @Embedded
    private Address address;
    private Boolean enableNotification;
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Notification> notifications = new ArrayList<>();
    @OneToMany(
            orphanRemoval = true,
            cascade = CascadeType.ALL,
            mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Recipe> recipes = new ArrayList<>();
    @OneToMany(
            orphanRemoval = true,
            cascade = CascadeType.ALL,
            mappedBy = "user")
    //TODO: fix LazyOption
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Challenge> challenges = new ArrayList<>();
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Comment> comments = new ArrayList<>();
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Publication> publications = new ArrayList<>();
    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Conversation> conversations = new ArrayList<>();
    @OneToMany(
            orphanRemoval = true,
            cascade = CascadeType.ALL,
            mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Reaction> reactions = new ArrayList<>();
    private String phone;


    @Override
    @PrePersist
    public void prePersist() {
        super.prePersist();
        preUpdate();
    }

    @Override
    @PreUpdate
    public void preUpdate() {
        super.preUpdate();
        dateOfBirthInString = dateOfBirth.format(DATE_FORMATTER);
    }

    public String toString() {
        return username;
    }
}
