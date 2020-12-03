//package com.study.raum.service;
//
//import com.study.raum.domain.products.ProductCategory;
//import com.study.raum.domain.products.ProductCategoryRepository;
//import com.study.raum.dto.ProductCategoryDto;
//import com.study.raum.service.common.BaseCrudService;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.data.domain.Page;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * @author kuh
// * @since 2020.04.11
// */
//
//@Service
//public class ProductCategoryService extends BaseCrudService<ProductCategory, ProductCategoryDto> {
//
//    public ProductCategoryService(@Qualifier("productCategoryRepository") ProductCategoryRepository productCategoryRepository) {
//        super(productCategoryRepository);
//    }
//
//    @Override
//    public ProductCategoryDto save(ProductCategoryDto dto) {
//        return entitySave(dto.toEntity());
//    }
//
//    @Override
//    public ProductCategoryDto update(long id, ProductCategoryDto dto) {
//        return new ProductCategoryDto(null);
//    }
//
//    @Override
//    public ProductCategoryDto delete(long id) {
//        return entityDelete(id);
//    }
//
//    @Override
//    public Page<ProductCategoryDto> findAll(int page, int size) {
//        return this.entityFindAll(page, size);
//    }
//
//    @Override
//    public List<ProductCategoryDto> findAll() {
//        return this.entityFindAll();
//    }
//
//    @Override
//    public List<ProductCategoryDto> findAllById(Iterable<Long> ids) {
//
//        return this.entityFindAllById(ids);
//    }
//
//    @Override
//    public ProductCategoryDto findById(long id) {
//
//        return entityFindByIdCastDto(id);
//    }
//}
