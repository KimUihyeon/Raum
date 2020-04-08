package com.study.raum.service;

import com.study.raum.dto.ProductDto;
import com.study.raum.service.common.ICommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Service
@RequiredArgsConstructor
public class ProductService implements ICommonService<ProductDto> {


    @Override
    public ProductDto save(ProductDto dto) {
        return null;
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
    public List<ProductDto> findAll() {
        return null;
    }

    @Override
    public ProductDto findById(long id) {
        return null;
    }
}
