package com.study.raum.domain.orders;

import com.study.raum.domain.deliveries.Delivery;
import com.study.raum.domain.members.Account;
import com.study.raum.domain.products.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 주문
 *
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String orderSerialNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;

    @OneToOne
    @JoinColumn(name = "order_product_id")
    private OrderProduct orderProduct;

    @OneToOne
    private Delivery delivery;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment payment;

    private String etc;
    private double productTotalPrice; // 상품 총액
    private double deliveryPrice;  // 배송비  
    private double paymentPrice; // 실제 결제 대금
    private Timestamp orderAt;
}
