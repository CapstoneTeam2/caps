package com.example.capstone_charging.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int MemberKey;

    @Column(nullable = false, length = 50)
    private String Name;

    @Column(nullable = false, length = 50)
    private String Id;

    @Column(nullable = false, length = 50)
    private String PassWord;

    @Column(nullable = false, length = 50)
    private String CarType;

    @Column(nullable = true)
    private boolean Busines;
}
