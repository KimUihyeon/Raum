package com.study.raum.service;

import com.study.raum.domain.members.Member;
import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductCategory;
import com.study.raum.domain.products.ProductCategoryRepository;
import com.study.raum.domain.products.ProductRepository;
import com.study.raum.dto.ProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author kuh
 * @since 2020.04.14
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductServiceTest {

    @Autowired
    protected ProductService productService;

    @Autowired
    private ProductCategoryService productCategoryService;

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    @Autowired
    private ProductRepository productRepository;


    @Test
    @Rollback
    public void productRelationInsertTest(){

        ProductCategory category = ProductCategory.builder()
                .name("카테고리 !!")
                .etc("")
                .build();

        Product product = Product.builder()
                .name("tset")
                .thumbnailPath("")
                .productCategory(category)
                .build();

        this.productService.save(new ProductDto((product)));

        this.productCategoryRepository.findAll().forEach(t->{
            LoggerUtil.sout(t.toString());
        });

//        this.productService.save(new ProductDto(product));
    }

}
