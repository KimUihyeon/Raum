package com.study.raum.domain.members;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "account_level")
public class AccountLevel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String description; // 설명

    @Column(length = 30)
    private String grade; // 회원등급 명

    private int level; // 회원등급 레벨
}
