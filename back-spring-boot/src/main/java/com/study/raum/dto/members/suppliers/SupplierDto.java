package com.study.raum.dto.members.suppliers;

import com.study.raum.domain.members.Supplier;
import com.study.raum.domain.products.Product;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * SupplierDto
 * 판매자 Dto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SupplierDto implements ToConverter<Supplier, SupplierDto> {

    private Long id;
    private String companyName;
    private String ceoName;
    private String tel;
    private String etc;
    private String address1;
    private String address2;
    public String address3;
    private String postNumber;

    @Builder.Default
    private List<ProductDto> products = new ArrayList<>();

    @Override
    public Supplier toEntity() {
        return Supplier.builder()
                .id(id)
                .tel(tel)
                .etc(etc)
                .ceoName(ceoName)
                .address1(address1)
                .address2(address2)
                .address3(address3)
                .postNumber(postNumber)
                .companyName(companyName)
                .build();
    }

    @Override
    public SupplierDto of(Supplier supplier) {
        SupplierDto dto = ModelConverter.map(supplier, SupplierDto.class);

        if (supplier.getProducts() != null && supplier.getProducts().size() > 0) {
            dto.products = supplier.getProducts()
                    .stream()
                    .map(e -> new ProductDto().of(e))
                    .collect(Collectors.toList());
        }
        return dto;
    }
}
