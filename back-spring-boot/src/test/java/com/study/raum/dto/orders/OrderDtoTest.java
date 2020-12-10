package com.study.raum.dto.orders;

import com.study.raum.domain.deliveries.Delivery;
import com.study.raum.domain.members.Account;
import com.study.raum.domain.orders.Order;
import com.study.raum.domain.orders.OrderProduct;
import com.study.raum.domain.orders.Payment;
import com.study.raum.dto.deliveries.DeliveryDto;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.DateUtil;
import com.study.raum.setting.util.data.ModelConverter;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Timestamp;

/**
 * 주문
 *
 * @author kuh
 * @since 2020.03.25
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class OrderDtoTest implements IDtoTest {

    private Long id = new Long(5);
    private String orderSerialNumber = "18972askjdb912he-h9ausd";

    private String etc = "test etc";
    private double productTotalPrice = 100000; // 상품 총액
    private double deliveryPrice = 2500;  // 배송비
    private double paymentPrice = 102500; // 실제 결제 대금
    private Timestamp orderAt = DateUtil.now();

    private Account account;
    private OrderProduct orderProduct;
    private Payment payment;
    private Delivery delivery;

    @Before
    public void init(){
        this.account = Account.builder().id(new Long(1)).build();
        this.orderProduct = OrderProduct.builder().id(new Long(2)).build();
        this.payment = Payment.builder().id(new Long(3)).build();
        this.delivery = Delivery.builder().id(new Long(4)).build();
    }


    @Test
    @Override
    public void dto로_변환_test() {
        //given
        Order order = Order.builder()
                .id(id)
                .etc(etc)
                .orderAt(orderAt)
                .paymentPrice(paymentPrice)
                .deliveryPrice(deliveryPrice)
                .orderSerialNumber(orderSerialNumber)
                .productTotalPrice(productTotalPrice)
                .account(account)
                .delivery(delivery)
                .orderProduct(orderProduct)
                .payment(payment)
                .build();
        ;
        //when
        OrderDto orderDto = new OrderDto().of(order);

        //then
        Assert.assertEquals(order.getId(), orderDto.getId());
        Assert.assertEquals(order.getEtc(), orderDto.getEtc());
        Assert.assertEquals(order.getOrderAt(), orderDto.getOrderAt());
        Assert.assertEquals(order.getPaymentPrice(), orderDto.getPaymentPrice(), 0);
        Assert.assertEquals(order.getOrderSerialNumber(), orderDto.getOrderSerialNumber());
        Assert.assertEquals(order.getProductTotalPrice(), orderDto.getProductTotalPrice(), 0);


        Assert.assertEquals(order.getAccount().getId(), orderDto.getAccount().getId());
        Assert.assertEquals(order.getPayment().getId(), orderDto.getPayment().getId());
        Assert.assertEquals(order.getOrderProduct().getId(), orderDto.getOrderProduct().getId());
    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        OrderDto orderDto = OrderDto.builder()
                .id(id)
                .etc(etc)
                .orderAt(orderAt)
                .paymentPrice(paymentPrice)
                .deliveryPrice(deliveryPrice)
                .orderSerialNumber(orderSerialNumber)
                .productTotalPrice(productTotalPrice)
                .account(new AccountDefaultDto(account))
                .delivery(new DeliveryDto().of(delivery))
                .orderProduct(new OrderProductDto().of(orderProduct))
                .payment(new PaymentDto().of(payment))
                .build();
        ;
        //when
        Order order = orderDto.toEntity();

        //then
        Assert.assertEquals(order.getId(), orderDto.getId());
        Assert.assertEquals(order.getEtc(), orderDto.getEtc());
        Assert.assertEquals(order.getOrderAt(), orderDto.getOrderAt());
        Assert.assertEquals(order.getPaymentPrice(), orderDto.getPaymentPrice(), 0);
        Assert.assertEquals(order.getOrderSerialNumber(), orderDto.getOrderSerialNumber());
        Assert.assertEquals(order.getProductTotalPrice(), orderDto.getProductTotalPrice(), 0);
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        Order order = Order.builder()
                .id(id)
                .etc(etc)
                .orderAt(orderAt)
                .paymentPrice(paymentPrice)
                .deliveryPrice(deliveryPrice)
                .orderSerialNumber(orderSerialNumber)
                .productTotalPrice(productTotalPrice)
                .account(account)
                .delivery(delivery)
                .orderProduct(orderProduct)
                .payment(payment)
                .build();
        ;
        //when
        OrderDto orderDto = new OrderDto().of(order);
        Order transOrderDto = orderDto.toEntity();

        //then
        Assert.assertEquals(order.getId(), transOrderDto.getId());
        Assert.assertEquals(order.getEtc(), transOrderDto.getEtc());
        Assert.assertEquals(order.getOrderAt(), transOrderDto.getOrderAt());
        Assert.assertEquals(order.getPaymentPrice(), transOrderDto.getPaymentPrice(), 0);
        Assert.assertEquals(order.getOrderSerialNumber(), transOrderDto.getOrderSerialNumber());
        Assert.assertEquals(order.getProductTotalPrice(), transOrderDto.getProductTotalPrice(), 0);

    }
}
