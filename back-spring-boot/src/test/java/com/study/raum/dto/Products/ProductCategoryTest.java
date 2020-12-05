package com.study.raum.dto.Products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductCategory;
import com.study.raum.dto.products.ProductCategoryDto;
import com.study.raum.dto.products.ProductDto;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.Column;
import javax.transaction.Transactional;

/**
 * ProductCategoryTest
 *
 * @author Kimuihyeon
 * @since 2020.12.04
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductCategoryTest {


    private String name = "test category Name";
    private String etc = "test category Memo";

    @Test
    @Rollback
    @Transactional
    public void ProductCategoryDto로_변환_Test() {

        //given
        ProductCategory productCategory = ProductCategory.builder()
                .id(new Long(1))
                .etc(etc)
                .name(name)
                .build();

        //when
        ProductCategoryDto productCategoryDto = new ProductCategoryDto().of(productCategory);

        //then

        Assert.assertEquals(productCategoryDto.getId(), productCategory.getId());
        Assert.assertEquals(productCategoryDto.getEtc(), productCategory.getEtc());
        Assert.assertEquals(productCategoryDto.getName(), productCategory.getName());
    }

    @Test
    @Rollback
    @Transactional
    public void ProductCategory로_변환_Test() {

        //given
        ProductCategoryDto productCategoryDto = ProductCategoryDto.builder()
                .id(new Long(1))
                .etc(etc)
                .name(name)
                .build();

        //when
        ProductCategory productCategory = productCategoryDto.toEntity();

        //then

        Assert.assertEquals(productCategoryDto.getId(), productCategory.getId());
        Assert.assertEquals(productCategoryDto.getEtc(), productCategory.getEtc());
        Assert.assertEquals(productCategoryDto.getName(), productCategory.getName());
    }

    @Test
    @Rollback
    @Transactional
    public void ProductCategoryDto로_변환후_Entity로_변환_Test() {

        //given
        ProductCategory productCategory = ProductCategory.builder()
                .id(new Long(1))
                .etc(etc)
                .name(name)
                .build();

        //when
        ProductCategoryDto productCategoryDto = new ProductCategoryDto().of(productCategory);
        ProductCategory transProductCategory = productCategoryDto.toEntity();

        //then

        Assert.assertEquals(transProductCategory.getId(), productCategory.getId());
        Assert.assertEquals(transProductCategory.getEtc(), productCategory.getEtc());
        Assert.assertEquals(transProductCategory.getName(), productCategory.getName());
    }
}
