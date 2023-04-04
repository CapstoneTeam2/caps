package com.example.capstone_charging.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ChargingStation_SubData_Public {
    @Id
    @Column
    private String Station;
    @Column
    private String Address;
}
