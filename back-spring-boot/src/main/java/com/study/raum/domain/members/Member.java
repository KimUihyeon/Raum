package com.study.raum.domain.members;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * @author kuh
 * @since 2020.03.08
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "members")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String userPw;

    private String userId;


    @Column(length = 50)
    private String tel;

    @Column(length = 50)
    private String emailSuffix;

    @Column(length = 50)
    private String emailPrefix;

    @Column(length = 100)
    private String address1;

    @Column(length = 100)
    private String address2;

    @Column(length = 20)
    private String postNumber;

    @Column(length = 30)
    private String signupType;

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", userPw='" + userPw + '\'' +
                ", userId='" + userId + '\'' +
                ", tel='" + tel + '\'' +
                ", emailSuffix='" + emailSuffix + '\'' +
                ", emailPrefix='" + emailPrefix + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2 + '\'' +
                ", postNumber='" + postNumber + '\'' +
                ", signupType='" + signupType + '\'' +
                '}';
    }
}