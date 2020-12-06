package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.Delivery;
import com.study.raum.domain.orders.Order;
import com.study.raum.dto.orders.OrderDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author kuh
 * @since 2020.03.25
 */


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryDto implements ToConverter<Delivery, DeliveryDto> {

    private Long id;

    private Delivery.DeliveryTypeEnum deliveryType; // 배송, 퀵, 방문조립
    private Delivery.DeliveryStepEnum deliveryStep; // 배송 단계

    private Timestamp startAt; // 배송시작시간
    private Timestamp arriveAt; // 배송도착시간
    private String deliveryMemo; // 배송 메모

    private DeliveryStaffDto deliveryStaff; // 배송 대행 회사
    private OrderDto order;

    @Override
    public Delivery toEntity() {
        return Delivery.builder()
                .id(id)
                .deliveryMemo(deliveryMemo)
                .deliveryStep(deliveryStep)
                .deliveryType(deliveryType)
                .startAt(startAt)
                .arriveAt(arriveAt)
                .build();
    }

    @Override
    public DeliveryDto of(Delivery d) {
        DeliveryDto dto = ModelConverter.map(d, DeliveryDto.class);
        if (dto.getOrder() != null) {
            // 따로 주입하기
        }
        if (d.getDeliveryStaff() != null) {
            dto.setDeliveryStaff(new DeliveryStaffDto().of(d.getDeliveryStaff()));
        }
        return dto;
    }
}
