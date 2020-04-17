package com.study.raum.service;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductCategory;
import com.study.raum.domain.products.ProductCategoryRepository;
import com.study.raum.dto.ProductCategoryDto;
import com.study.raum.service.common.BaseCrudService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.04.11
 */

@Service
public class ProductCategoryService extends BaseCrudService<ProductCategory, ProductCategoryDto> {

    public ProductCategoryService(@Qualifier("productCategoryRepository") ProductCategoryRepository productCategoryRepository) {
        super(productCategoryRepository);
    }

    @Override
    public ProductCategoryDto save(ProductCategoryDto dto) {
        return entitySave(dto.toEntity());
    }

    @Override
    public ProductCategoryDto update(long id, ProductCategoryDto dto) {
//        ProductCategory productCategory = this.productCategoryRepository.findById(id)
//                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));
//
//        productCategory.patch(dto.getName(), dto.getEtc());

        return new ProductCategoryDto(null);
    }

    @Override
    public ProductCategoryDto delete(long id) {
        return entityDelete(id);
    }

    @Override
    public List<ProductCategoryDto> findAll(int page, int size) {
        return entityFindAll(page, size);
//        return this.productCategoryRepository.findAll(PageRequest.of(page, size))
//                .stream()
//                .map(entity -> new ProductCategoryDto(entity))
//                .collect(Collectors.toList());
    }

    @Override
    public List<ProductCategoryDto> findAll() {
        return entityFindAll();
//
//        return this.productCategoryRepository.findAll(Sort.by("id"))
//                .stream()
//                .map(entity -> new ProductCategoryDto(entity))
//                .collect(Collectors.toList());
    }

    @Override
    public ProductCategoryDto findById(long id) {

        return entityFindByIdCastDto(id);
//        ProductCategory productCategory = this.productCategoryRepository.findById(id)
//                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));
//        return new ProductCategoryDto(productCategory);
    }
}
