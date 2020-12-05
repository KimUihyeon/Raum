package com.study.raum.dto.Products;

import com.study.raum.domain.products.Product;
import com.study.raum.dto.members.suppliers.SupplierDto;
import com.study.raum.dto.products.ProductCategoryDto;
import com.study.raum.dto.products.ProductDetailDto;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.setting.util.data.ModelConverter;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;

/**
 * ProductDtoTest
 *
 * @author Kimuihyeon
 * @since 2020.12.04
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductDtoTest {

    private String thumbnailPath = "/test/root/thumbnailPath.jpg";
    private String name = "name Test";
    private double price = 100000;
    private double sale = 10;
    private boolean isSell = false;
    private int hit = 91238;

    @Test
    @Rollback
    @Transactional
    public void ProductDto로_변환_Test() {

        //given
        Product product = Product.builder()
                .id(new Long(1))
                .thumbnailPath(thumbnailPath)
                .name(name)
                .hit(hit)
                .price(price)
                .isSell(isSell)
                .sale(sale)
                .build();

        //when
        ProductDto productDto = new ProductDto().of(product);

        //then

        Assert.assertEquals(productDto.getId(), product.getId());
        Assert.assertEquals(productDto.getHit(), product.getHit());
        Assert.assertEquals(productDto.isSell(), product.isSell());
        Assert.assertEquals(productDto.getSale(), product.getSale(), 0);
        Assert.assertEquals(productDto.getName(), product.getName());
        Assert.assertEquals(productDto.getPrice(), product.getPrice(), 0);
        Assert.assertEquals(productDto.getThumbnailPath(), product.getThumbnailPath());
    }


    @Test
    @Rollback
    @Transactional
    public void Product로_변환_Test() {
        //given
        ProductDto productDto = ProductDto.builder()
                .id(new Long(1))
                .thumbnailPath(thumbnailPath)
                .name(name)
                .hit(hit)
                .price(price)
                .isSell(isSell)
                .sale(sale)
                .build();

        //when
        Product product = productDto.toEntity();

        //then

        Assert.assertEquals(productDto.getId(), product.getId());
        Assert.assertEquals(productDto.getHit(), product.getHit());
        Assert.assertEquals(productDto.isSell(), product.isSell());
        Assert.assertEquals(productDto.getSale(), product.getSale(), 0);
        Assert.assertEquals(productDto.getName(), product.getName());
        Assert.assertEquals(productDto.getPrice(), product.getPrice(), 0);
        Assert.assertEquals(productDto.getThumbnailPath(), product.getThumbnailPath());
    }

    @Test
    @Rollback
    @Transactional
    public void ProductDto로_변환후_Entity로_변환_Test() {
        //given
        Product product = Product.builder()
                .id(new Long(1))
                .thumbnailPath(thumbnailPath)
                .name(name)
                .hit(hit)
                .price(price)
                .isSell(isSell)
                .sale(sale)
                .build();

        //when
        ProductDto productDto = new ProductDto().of(product);
        Product transProduct = productDto.toEntity();

        //then

        Assert.assertEquals(transProduct.getId(), product.getId());
        Assert.assertEquals(transProduct.getHit(), product.getHit());
        Assert.assertEquals(transProduct.isSell(), product.isSell());
        Assert.assertEquals(transProduct.getSale(), product.getSale(), 0);
        Assert.assertEquals(transProduct.getName(), product.getName());
        Assert.assertEquals(transProduct.getPrice(), product.getPrice(), 0);
        Assert.assertEquals(transProduct.getThumbnailPath(), product.getThumbnailPath());
    }

//
//    ProductDto dto = ModelConverter.map(p, ProductDto.class);
//        if (p.getProductCategory() != null) {
//        dto.setCategory(new ProductCategoryDto().of(p.getProductCategory()));
//    }
//        if(p.getProductDetail() != null) {
//        dto.setDetail(new ProductDetailDto().of(p.getProductDetail()));
//    }
//        if(p.getSupplier() != null){
//        dto.setSupplier(new SupplierDto().of(p.getSupplier()));
//    }
}
