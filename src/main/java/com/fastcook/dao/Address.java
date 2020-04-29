package com.fastcook.dao;

import lombok.Data;

import javax.persistence.Embeddable;

@Data
@Embeddable
public class Address {
    private Integer roadNumber;
    private String roadType;
    private String roadName;
    private String postalCode;
    private String town;
    private String country;
}
