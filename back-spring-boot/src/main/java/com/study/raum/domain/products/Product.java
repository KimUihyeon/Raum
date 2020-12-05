package com.study.raum.domain.products;

import com.study.raum.domain.members.Supplier;
import lombok.*;

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
    private Long id;

    private String name;

    @Setter
    @ManyToOne(targetEntity = ProductCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId")
    private ProductCategory productCategory;

    @Setter
    @OneToOne(fetch = FetchType.LAZY, targetEntity = ProductDetail.class, mappedBy = "product")
    private ProductDetail productDetail;

    @Setter
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
