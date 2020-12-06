package com.study.raum.dto.orders;

import com.study.raum.domain.deliveries.Delivery;
import com.study.raum.domain.members.Account;
import com.study.raum.domain.orders.Order;
import com.study.raum.domain.orders.Payment;
import com.study.raum.dto.deliveries.DeliveryDto;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * 주문
 *
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto implements ToConverter<Order, OrderDto> {

    private Long id;
    private String orderSerialNumber;
    private AccountDefaultDto account;

    private OrderProductDto orderProduct;
    private PaymentDto payment;

    private DeliveryDto delivery;

    private String etc;
    private double productTotalPrice; // 상품 총액
    private double deliveryPrice;  // 배송비  
    private double paymentPrice; // 실제 결제 대금
    private Timestamp orderAt;

    @Override
    public Order toEntity() {
        return Order.builder()
                .id(id)
                .etc(etc)
                .orderAt(orderAt)
                .paymentPrice(paymentPrice)
                .deliveryPrice(deliveryPrice)
                .orderSerialNumber(orderSerialNumber)
                .productTotalPrice(productTotalPrice)
                .build();
    }

    @Override
    public OrderDto of(Order o) {
        OrderDto dto = ModelConverter.map(o, OrderDto.class);
        if (o.getAccount() != null) {
            dto.setAccount(new AccountDefaultDto(o.getAccount()));
        }
        if (o.getDelivery() != null) {
            // 따로 주입하기
        }
        if (o.getPayment() != null) {
            dto.setPayment(new PaymentDto().of(o.getPayment()));
        }
        return dto;
    }
}
