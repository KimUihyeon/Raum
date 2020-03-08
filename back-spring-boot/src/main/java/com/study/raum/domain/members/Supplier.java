package com.study.raum.domain.members;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * supplier Domain Object
 *
 * @author kuh
 * @since 2020.03.08
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "suppliers")
public class Supplier {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 50)
    private String companyName;

    @Column(length = 50)
    private String ceoName;

    @Column(length = 50)
    private String tel;

    private String etc;

    @Column(length = 100)
    private String address1;

    @Column(length = 100)
    private String address2;

    @Column(length = 20)
    private String postNumber;

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", ceoName='" + ceoName + '\'' +
                ", tel='" + tel + '\'' +
                ", etc='" + etc + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2 + '\'' +
                ", postNumber='" + postNumber + '\'' +
                '}';
    }


}
