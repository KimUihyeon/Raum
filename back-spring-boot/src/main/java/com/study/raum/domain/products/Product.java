package com.study.raum.domain.products;

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
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    private long supplierId;

//    private long categoryId;

    @ManyToOne(targetEntity = ProductCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId")
    private ProductCategory productCategory;

    private String thumbnailPath;

    private long memberId;

    private double price;

    private double sale;

    private boolean isUse;

    private int hit;
}
