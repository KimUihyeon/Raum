package com.study.raum.dto.orders;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.orders.OrderProduct;
import com.study.raum.domain.orders.Payment;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDto implements ToConverter<Payment, PaymentDto> {

    public Long id;
    public OrderDto order;
    public String paymentType;
    public Timestamp paymentAt;
    private AccountDefaultDto account;

    @Override
    public Payment toEntity() {
        return Payment.builder()
                .id(id)
                .paymentAt(paymentAt)
                .paymentType(paymentType)
                .build();
    }

    @Override
    public PaymentDto of(Payment p) {
        PaymentDto dto = ModelConverter.map(p, PaymentDto.class);
        if (p.getAccount() != null) {
            dto.setAccount(new AccountDefaultDto(p.getAccount()));
        }
        if (p.getOrder() != null) {
            dto.setOrder(new OrderDto().of(p.getOrder()));
        }
        if (p.getOrder() != null) {
            dto.setOrder(new OrderDto().of(p.getOrder()));
        }
        return dto;
    }
}
