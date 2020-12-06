package com.study.raum.dto.orders;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.orders.OrderProduct;
import com.study.raum.domain.products.Product;
import com.study.raum.dto.members.accounts.AccountDto;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.03.25
 */


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderProductDto implements ToConverter<OrderProduct, OrderProductDto> {

    private Long id;

    @Builder.Default
    private List<ProductDto> products = new ArrayList<>();


    @Override
    public OrderProduct toEntity() {
        return OrderProduct.builder()
                .id(id)
                .build();
    }

    @Override
    public OrderProductDto of(OrderProduct op) {
        OrderProductDto dto = ModelConverter.map(op, OrderProductDto.class);
        if (op.getProducts() != null && op.getProducts().size() > 0) {
            dto.setProducts(op.getProducts().stream().map(e-> new ProductDto().of(e)).collect(Collectors.toList()));
        }
        return dto;
    }
}
