package com.study.raum.service;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductCategory;
import com.study.raum.domain.products.ProductCategoryRepository;
import com.study.raum.domain.products.ProductRepository;
import com.study.raum.dto.ProductCategoryDto;
import com.study.raum.dto.ProductDto;
import com.study.raum.service.common.ICommonService;
import com.study.raum.setting.PropertyFileManager;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;

/**
 * @author kuh
 * @since 2020.04.11
 */

@Service
@RequiredArgsConstructor
@PropertySource(PropertyFileManager.ERROR_MGS_PROP)
public class ProductCategoryService implements ICommonService<ProductCategoryDto> {

    private final ProductCategoryRepository productCategoryRepository;

    @Value("${not_find_data}")
    private String NOT_FIND_DATA;

    @Override
    public ProductCategoryDto save(ProductCategoryDto dto) {
        long id = this.productCategoryRepository.save(dto.toEntity()).getId();
        ProductCategoryDto productCategoryDto = null;

        if (id > 0) {
            ProductCategory productCategory = this.productCategoryRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));

            productCategoryDto = new ProductCategoryDto(productCategory);
        }

        return productCategoryDto;
    }

    @Override
    public ProductCategoryDto update(long id, ProductCategoryDto dto) {
        return null;
    }

    @Override
    public ProductCategoryDto delete(long id) {
        return null;
    }

    @Override
    public List<ProductCategoryDto> findAll() {
        return null;
    }

    @Override
    public ProductCategoryDto findById(long id) {
        return null;
    }
}
