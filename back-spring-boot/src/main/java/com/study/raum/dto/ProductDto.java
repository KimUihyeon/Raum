package com.study.raum.dto;

import com.study.raum.domain.products.Product;
import com.study.raum.dto.common.IEntityConverter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kuh
 * @since 2020.04.08
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto implements IEntityConverter<Product> {


    @Override
    public Product toEntity() {
        return null;
    }
}
