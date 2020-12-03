package com.study.raum.domain.deliveries;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * DeliveryMan
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "delivery_staff")
public class DeliveryStaff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String allocatedArea;

    private String grade; // 직원 평점

    private String phoneNumber; // 전화 번호

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "delivery_company_id")
    private DeliveryCompany deliveryCompany;
}
