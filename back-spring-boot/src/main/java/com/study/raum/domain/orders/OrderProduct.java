package com.study.raum.domain.orders;

import com.study.raum.domain.products.Product;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kuh
 * @since 2020.03.25
 */


@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orderProducts")
public class OrderProduct {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @Setter
    @OneToOne(mappedBy = "orderProduct")
    private Order order;

    @Setter
    @OneToMany
    @Builder.Default
    private List<Product> products = new ArrayList<>();

    public long productId;
    public long orderId;
}
