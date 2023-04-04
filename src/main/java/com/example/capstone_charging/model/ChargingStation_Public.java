package com.example.capstone_charging.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ChargingStation_Public {
    @Column
    private String City;
    @Column
    private String Local;
    @Column
    private String StationName;
    @Id
    @Column
    private int ChargeID;
    @Column
    private int Capacity;
    @Column
    private String ChargeName;
    @Column
    private String StationType;
    @Column
    private String ChargeType;
}
