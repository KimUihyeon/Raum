package com.study.raum.domain.products;

import com.study.raum.domain.members.Supplier;
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

    @ManyToOne(targetEntity = ProductCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId")
    private ProductCategory productCategory;

    @OneToOne(fetch = FetchType.LAZY, targetEntity = ProductDetail.class)
    private ProductDetail productDetail;

    @ManyToOne(fetch = FetchType.LAZY , targetEntity = Supplier.class)
    @JoinColumn(name = "supplier_id")
    private Supplier supplier; // 판매자

    private String thumbnailPath;

    private double price;
    private double sale;
    @Builder.Default
    private boolean isSell = true; // 파는 상품인지 유무
    private int hit;
}
