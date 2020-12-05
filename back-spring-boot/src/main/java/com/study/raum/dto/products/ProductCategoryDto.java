package com.study.raum.dto.products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductCategory;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.Column;

/**
 * ProductCategoryDto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductCategoryDto implements ToConverter<ProductCategory, ProductCategoryDto> {

    private Long id;
    private String name;
    private String etc;

    @Override
    public ProductCategory toEntity() {
        return ProductCategory.builder()
                .id(id)
                .name(name)
                .etc(etc)
                .build();
    }

    @Override
    public ProductCategoryDto of(ProductCategory productCategory) {
        return ModelConverter.map(productCategory, ProductCategoryDto.class);
    }
}
