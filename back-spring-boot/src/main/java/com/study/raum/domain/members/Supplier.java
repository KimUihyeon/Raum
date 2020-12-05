package com.study.raum.domain.members;

import com.study.raum.domain.products.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 구매자.
 * <p>
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
@Table(name = "supplier")
public class Supplier { //판매자

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @Column(length = 100)
    public String address3;

    @Column(length = 20)
    private String postNumber;

    @OneToMany(mappedBy = "supplier")
    @Builder.Default
    private List<Product> products = new ArrayList<>();

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
                ", address3='" + address3 + '\'' +
                ", postNumber='" + postNumber + '\'' +
                '}';
    }


}
