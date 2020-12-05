package com.study.raum.dto.Products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ShowRoomProduct;
import com.study.raum.dto.products.ProductDetailDto;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.dto.products.ShowRoomProductDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.DateUtil;
import com.study.raum.setting.util.data.ModelConverter;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Timestamp;

/**
 * ShowRoomProductDto
 *
 * @author Kimuihyeon
 * @since 2020.12.05
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ShowRoomProductDtoTest {

    private Long id = new Long(1);
    private int x = 3;
    private int y = 3;
    private Timestamp createAt = DateUtil.now();
    private Timestamp deleteAt = DateUtil.now();
    private Timestamp updateAt = DateUtil.now();
    private Product product;

    @Before
    public void init() {
        this.product = Product.builder()
                .id(new Long(1))
                .name("Tes Product")
                .build();
    }

    @Test
    public void ShowRoomProduct로_변환_Test() {
        //given
        ShowRoomProductDto showRoomProductDto = ShowRoomProductDto.builder()
                .id(id)
                .x(x)
                .y(y)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .product(new ProductDto().of(product))
                .build();

        //when
        ShowRoomProduct showRoomProduct = showRoomProductDto.toEntity(); // 릴레이션 객체 변환은 안함

        //then
        Assert.assertEquals(showRoomProductDto.getX(), showRoomProduct.getX());
        Assert.assertEquals(showRoomProductDto.getY(), showRoomProduct.getY());
        Assert.assertEquals(showRoomProductDto.getId(), showRoomProduct.getId());
        Assert.assertEquals(showRoomProductDto.getCreateAt(), showRoomProduct.getCreateAt());
        Assert.assertEquals(showRoomProductDto.getDeleteAt(), showRoomProduct.getDeleteAt());
        Assert.assertEquals(showRoomProductDto.getUpdateAt(), showRoomProduct.getUpdateAt());

    }

    @Test
    public void ShowRoomProductDto로_변환_Test() {
        //given
        ShowRoomProduct showRoomProduct = ShowRoomProduct.builder()
                .id(id)
                .x(x)
                .y(y)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .product(product)
                .build();

        //when
        ShowRoomProductDto showRoomProductDto = new ShowRoomProductDto().of(showRoomProduct);

        //then
        Assert.assertEquals(showRoomProduct.getX(), showRoomProductDto.getX());
        Assert.assertEquals(showRoomProduct.getY(), showRoomProductDto.getY());
        Assert.assertEquals(showRoomProduct.getId(), showRoomProductDto.getId());
        Assert.assertEquals(showRoomProduct.getCreateAt(), showRoomProductDto.getCreateAt());
        Assert.assertEquals(showRoomProduct.getDeleteAt(), showRoomProductDto.getDeleteAt());
        Assert.assertEquals(showRoomProduct.getUpdateAt(), showRoomProductDto.getUpdateAt());

        Assert.assertEquals(showRoomProduct.getProduct().getName(), showRoomProductDto.getProduct().getName());// 릴레이션 변환 되는지 체크 필요
    }

    @Test
    public void ShowRoomProductDto로_변환후_Entity로_변환_Test() {
        //given
        ShowRoomProduct showRoomProduct = ShowRoomProduct.builder()
                .id(id)
                .x(x)
                .y(y)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .product(product)
                .build();

        //when
        ShowRoomProductDto showRoomProduct2 = new ShowRoomProductDto().of(showRoomProduct);
        ShowRoomProduct transShowRoomProduct = showRoomProduct2.toEntity();

        //then
        Assert.assertEquals(showRoomProduct.getX(), transShowRoomProduct.getX());
        Assert.assertEquals(showRoomProduct.getY(), transShowRoomProduct.getY());
        Assert.assertEquals(showRoomProduct.getId(), transShowRoomProduct.getId());
        Assert.assertEquals(showRoomProduct.getCreateAt(), transShowRoomProduct.getCreateAt());
        Assert.assertEquals(showRoomProduct.getDeleteAt(), transShowRoomProduct.getDeleteAt());
        Assert.assertEquals(showRoomProduct.getUpdateAt(), transShowRoomProduct.getUpdateAt());
    }
}
