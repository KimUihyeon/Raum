package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.DeliveryCompany;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

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
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryCompanyDto implements ToConverter<DeliveryCompany, DeliveryCompanyDto> {

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

//    private List<DeliveryStaffDto> staffs = new ArrayList<>(); // 순환참조로 사용하지 않음


    @Override
    public DeliveryCompany toEntity() {
        return DeliveryCompany.builder()
                .id(id)
                .add1(add1)
                .add2(add2)
                .add3(add3)
                .isUse(isUse)
                .companyName(companyName)
                .postNumber(postNumber)
                .managerName(managerName)
                .managerPhone(managerPhone)
                .contractAt(contractAt)
                .build();
    }

    @Override
    public DeliveryCompanyDto of(DeliveryCompany dc) {
        DeliveryCompanyDto dto = ModelConverter.map(dc, DeliveryCompanyDto.class);
        return dto;
    }
}
