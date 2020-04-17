package com.study.raum.service;

import com.study.raum.domain.products.ProductCategory;
import com.study.raum.domain.products.ProductCategoryRepository;
import com.study.raum.dto.ProductCategoryDto;
import com.study.raum.service.common.ServiceBase;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.04.11
 */

@RequiredArgsConstructor
public class ProductCategoryServiceBase extends ServiceBase<ProductCategoryDto> {

    private final ProductCategoryRepository productCategoryRepository;

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
        ProductCategory productCategory = this.productCategoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));

        productCategory.patch(dto.getName(), dto.getEtc());

        return new ProductCategoryDto(productCategory);
    }

    @Override
    public ProductCategoryDto delete(long id) {
        ProductCategory productCategory = this.productCategoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));

        this.productCategoryRepository.delete(productCategory);
        return new ProductCategoryDto(productCategory);
    }

    @Override
    public List<ProductCategoryDto> findAll(int page, int size) {
        return this.productCategoryRepository.findAll(PageRequest.of(page, size))
                .stream()
                .map(entity -> new ProductCategoryDto(entity))
                .collect(Collectors.toList());
    }

    @Override
    public List<ProductCategoryDto> findAll() {

        return this.productCategoryRepository.findAll(Sort.by("id"))
                .stream()
                .map(entity -> new ProductCategoryDto(entity))
                .collect(Collectors.toList());
    }

    @Override
    public ProductCategoryDto findById(long id) {
        ProductCategory productCategory = this.productCategoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));
        return new ProductCategoryDto(productCategory);
    }
}
