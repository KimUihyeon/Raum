package com.study.raum.domain.deliveries;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * DeliveryCompany
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "delivery_company")
public class DeliveryCompany {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String add1;
    private String add2;
    private String add3;
    private String postNumber;

    private String companyName; // 대표 이름

    private String managerName; // 대표 성명
    private String managerPhone;  // 대표 연락처

    private Timestamp contractAt; // 업체 계약일
    private boolean isUse; // 거래 중인 업체인지.

    @OneToMany(mappedBy = "deliveryCompany")
    @Builder.Default
    private List<DeliveryStaff> staffs = new ArrayList<>();
}
