package com.study.raum.domain.deliveries;

import com.study.raum.domain.orders.Order;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "delivery")
public class Delivery {

    public enum DeliveryTypeEnum {배송, 퀵, 방문_조립,}

    public enum DeliveryStepEnum {
        상품_준비_중, // 상품이 제조사에 있는 경우
        상품_인수,  // 상품을 인수 받음.
        상품_이동_중, // 상품이 배달지로 가는중
        배달지_도착, // 상품이 배달지에 도착함
        배송_완료 // 상품이 고객에게 배달됨.
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "delivery")
    @JoinColumn(name = "order_id")
    private Order order;

    @Enumerated(EnumType.STRING)
    private DeliveryTypeEnum deliveryType; // 배송, 퀵, 방문조립

    @Enumerated(EnumType.STRING)
    @Column(name = "delivery_step", length = 50)
    private DeliveryStepEnum deliveryStep; // 배송 단계

    private Timestamp startAt; // 배송시작시간
    private Timestamp arriveAt; // 배송도착시간
    private String deliveryMemo; // 배송 메모


    @OneToOne
    @JoinColumn(name = "delivery_staff_id")
    private DeliveryStaff deliveryStaff; // 배송 대행 회사


}
