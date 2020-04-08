package com.study.raum.dto;

import com.study.raum.domain.products.Product;
import com.study.raum.dto.common.IEntityConverter;

/**
 * @author kuh
 * @since 2020.04.08
 */
public class ProductCategoryDto implements IEntityConverter<Product> {


    @Override
    public Product toEntity() {
        return null;
    }

}
