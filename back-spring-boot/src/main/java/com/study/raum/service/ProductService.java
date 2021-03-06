//package com.study.raum.service;
//
//import com.study.raum.domain.products.Product;
//import com.study.raum.domain.products.ProductRepository;
//import com.study.raum.dto.ProductDto;
//import com.study.raum.dto.SupplierDto;
//import com.study.raum.service.common.BaseCrudService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * @author kuh
// * @since 2020.03.08
// */
//
//@Service
//public class ProductService extends BaseCrudService<Product, ProductDto, Long> {
//
//
//    @Autowired
//    public ProductService(ProductRepository productRepository) {
//        super(productRepository);
//    }
//
//    @Override
//    public ProductDto save(ProductDto dto) {
//        return entitySave(dto.toEntity());
//    }
//
//    @Override
//    public ProductDto update(long id, ProductDto dto) {
//        return null;
//    }
//
//    @Override
//    public ProductDto delete(long id) {
//        return null;
//    }
//
//    @Override
//    public Page<ProductDto> findAll(int page, int size) {
//        return null;
//    }
//
//    @Override
//    public List<ProductDto> findAll() {
//        return null;
//    }
//
//    @Override
//    public List<ProductDto> findAllById(Iterable<Long> ids) {
//
//        return this.entityFindAllById(ids);
//    }
//
//    @Override
//    public ProductDto findById(long id) {
//        return null;
//    }
//}
