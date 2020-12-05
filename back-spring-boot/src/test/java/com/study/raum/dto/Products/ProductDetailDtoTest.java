package com.study.raum.dto.Products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductDetail;
import com.study.raum.dto.products.ProductDetailDto;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.setting.util.DateUtil;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * ProductDetailDtoTest
 *
 * @author Kimuihyeon
 * @since 2020.12.04
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductDetailDtoTest {

    private String object3dFilePath = "/root/test/test.max";
    private Timestamp createAt = DateUtil.now();
    private Timestamp deleteAt = DateUtil.now();
    private String context = "context Test";

    @Test
    @Rollback
    @Transactional
    public void ProductDetailDto로_변환_Test() {
        //given
        ProductDetail productDetail = ProductDetail.builder()
                .id(new Long(1))
                .objectFileId(object3dFilePath)
                .context(context)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .build();

        //when
        ProductDetailDto productDetailDto = new ProductDetailDto().of(productDetail);

        //then
        Assert.assertEquals(productDetailDto.getId(), productDetail.getId());
        Assert.assertEquals(productDetailDto.getContext(), productDetail.getContext());
        Assert.assertEquals(productDetailDto.getCreateAt(), productDetail.getCreateAt());
        Assert.assertEquals(productDetailDto.getDeleteAt(), productDetail.getDeleteAt());
        Assert.assertEquals(productDetailDto.getObjectFileId(), productDetail.getObjectFileId());
    }


    @Test
    @Rollback
    @Transactional
    public void ProductDetail로_변환_Test() {
        //given
        ProductDetailDto productDetailDto = ProductDetailDto.builder()
                .id(new Long(1))
                .objectFileId(object3dFilePath)
                .context(context)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .build();

        //when
        ProductDetail productDetail = productDetailDto.toEntity();

        //then
        Assert.assertEquals(productDetailDto.getId(), productDetail.getId());
        Assert.assertEquals(productDetailDto.getContext(), productDetail.getContext());
        Assert.assertEquals(productDetailDto.getCreateAt(), productDetail.getCreateAt());
        Assert.assertEquals(productDetailDto.getDeleteAt(), productDetail.getDeleteAt());
        Assert.assertEquals(productDetailDto.getObjectFileId(), productDetail.getObjectFileId());
    }




    @Test
    @Rollback
    @Transactional
    public void ProductDetailDto로_변환후_Entity로_변환_Test() {
        //given
        ProductDetail productDetail = ProductDetail.builder()
                .id(new Long(1))
                .objectFileId(object3dFilePath)
                .context(context)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .build();

        //when
        ProductDetailDto productDetailDto = new ProductDetailDto().of(productDetail);
        ProductDetail transProductDetail = productDetailDto.toEntity();

        //then
        Assert.assertEquals(transProductDetail.getId(), productDetail.getId());
        Assert.assertEquals(transProductDetail.getContext(), productDetail.getContext());
        Assert.assertEquals(transProductDetail.getCreateAt(), productDetail.getCreateAt());
        Assert.assertEquals(transProductDetail.getDeleteAt(), productDetail.getDeleteAt());
        Assert.assertEquals(transProductDetail.getObjectFileId(), productDetail.getObjectFileId());
    }
}
