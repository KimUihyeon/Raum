package com.study.raum.dto.orders;

import com.study.raum.domain.orders.OrderProduct;
import com.study.raum.domain.products.Product;
import com.study.raum.dto.products.ProductDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.03.25
 */


@SpringBootTest
@RunWith(SpringRunner.class)
public class OrderProductDtoTest implements IDtoTest {

    private Long id;

    private List<Product> products = new ArrayList<>();


    @Before
    public void init() {

        this.products.add(Product.builder().id(new Long(1)).build());
        this.products.add(Product.builder().id(new Long(2)).build());
        this.products.add(Product.builder().id(new Long(3)).build());
    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        OrderProduct orderProduct = OrderProduct.builder()
                .id(id)
                .products(products)
                .build();

        //when
        OrderProductDto orderProductDto = new OrderProductDto().of(orderProduct);

        //then
        Assert.assertEquals(orderProductDto.getId(), orderProduct.getId());

        for (int i = 0; i < orderProduct.getProducts().size(); i++) {
            Long originID = orderProduct.getProducts().get(i).getId();
            Long targetId = orderProductDto.getProducts().get(i).getId();
            Assert.assertEquals(originID, targetId);
        }
    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        OrderProductDto orderProductDto = OrderProductDto.builder()
                .id(id)
                .products(products.stream().map(p -> new ProductDto().of(p)).collect(Collectors.toList()))
                .build();

        //when
        OrderProduct orderProduct = orderProductDto.toEntity();

        //then
        Assert.assertEquals(orderProductDto.getId(), orderProduct.getId());

        for (int i = 0; i < orderProduct.getProducts().size(); i++) {
            Long targetId = orderProduct.getProducts().get(i).getId();
            Long originID = orderProductDto.getProducts().get(i).getId();
            Assert.assertEquals(originID, targetId);
        }

    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        OrderProduct orderProduct = OrderProduct.builder()
                .id(id)
                .products(products)
                .build();

        //when
        OrderProductDto orderProductDto = new OrderProductDto().of(orderProduct);
        OrderProduct transOrderProduct = orderProductDto.toEntity();
        transOrderProduct.setProducts(orderProductDto.getProducts().stream().map(p -> p.toEntity()).collect(Collectors.toList()));

        //then
        Assert.assertEquals(transOrderProduct.getId(), orderProduct.getId());

        for (int i = 0; i < orderProduct.getProducts().size(); i++) {
            Long originID = orderProduct.getProducts().get(i).getId();
            Long targetId = transOrderProduct.getProducts().get(i).getId();
            Assert.assertEquals(originID, targetId);
        }
    }
}