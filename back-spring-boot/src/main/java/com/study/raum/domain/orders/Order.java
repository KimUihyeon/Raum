package com.study.raum.domain.orders;

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
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;
    public String orderSerialNumber;
    public long memberId;
    public String ect;
    public double productTotalPrice;
    public double paymentPrice;
    public double deliveryPrice;
    public LocalDateTime orderDate;
}
