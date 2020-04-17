package com.study.raum.dto;

import com.study.raum.domain.products.ProductCategory;
import com.study.raum.dto.common.AbsDtoConverter;
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
public class ProductCategoryDto extends AbsDtoConverter<ProductCategory> {


    private long id;
    private String etc;
    private String name;


    public ProductCategoryDto(ProductCategory entity) {
        super(entity);
    }

    @Override
    public ProductCategory toEntity() {

        return ProductCategory.builder()
                .etc(this.etc)
                .name(this.name)
                .build();
    }

    @Override
    public void createDto(ProductCategory entity) {
        this.id = entity.getId();
        this.etc = entity.getEtc();
        this.name = entity.getName();
    }

}
