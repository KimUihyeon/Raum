package com.study.raum.service;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductRepository;
import com.study.raum.dto.ProductDto;
import com.study.raum.service.common.IServiceBase;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Service
@RequiredArgsConstructor
public class ProductServiceBase implements IServiceBase<ProductDto> {

    private final ProductRepository productRepository;


    @Override
    public ProductDto save(ProductDto dto) {
        Product entity = dto.toEntity();
        Product savedEntity = this.productRepository.save(entity);
        return new ProductDto(savedEntity);
    }

    @Override
    public ProductDto update(long id, ProductDto dto) {
        return null;
    }

    @Override
    public ProductDto delete(long id) {
        return null;
    }

    @Override
    public List<ProductDto> findAll(int page, int size) {
        return null;
    }

    @Override
    public List<ProductDto> findAll() {
        return null;
    }

    @Override
    public ProductDto findById(long id) {
        return null;
    }
}
