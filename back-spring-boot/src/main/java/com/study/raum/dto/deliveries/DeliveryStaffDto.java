package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.DeliveryStaff;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;

/**
 * DeliveryMan
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryStaffDto implements ToConverter<DeliveryStaff, DeliveryStaffDto> {

    private Long id;
    private String name;
    private String allocatedArea;
    private String grade; // 직원 평점
    private String phoneNumber; // 전화 번호
    private DeliveryCompanyDto deliveryCompany;

    @Override
    public DeliveryStaff toEntity() {
        return DeliveryStaff.builder()
                .id(id)
                .name(name)
                .grade(grade)
                .allocatedArea(allocatedArea)
                .phoneNumber(phoneNumber)
                .build();
    }

    @Override
    public DeliveryStaffDto of(DeliveryStaff d) {
        DeliveryStaffDto dto = ModelConverter.map(d, DeliveryStaffDto.class);
        if (d.getDeliveryCompany() != null) {
            dto.setDeliveryCompany(new DeliveryCompanyDto().of(d.getDeliveryCompany()));
        }
        return dto;
    }
}
