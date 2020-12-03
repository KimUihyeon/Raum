package com.study.raum.domain.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "productDetails")
public class ProductDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;

    @OneToOne(mappedBy = "productDetail")
    @JoinColumn(name = "product_id")
    private Product product;

    public long objectFileId;

    public LocalDateTime regDate;
    public LocalDateTime delDate;

    public String context;

}
