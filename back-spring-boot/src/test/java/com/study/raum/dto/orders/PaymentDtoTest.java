package com.study.raum.dto.orders;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.orders.Order;
import com.study.raum.domain.orders.Payment;
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
 * @author kuh
 * @since 2020.03.25
 */


@SpringBootTest
@RunWith(SpringRunner.class)
public class PaymentDtoTest implements IDtoTest {

    private Long id = new Long(3);
    private String paymentType = "카드결제";
    private Timestamp paymentAt = DateUtil.now();

    private Order order;
    private Account account;


    @Before
    public void init(){
        this.order = Order.builder().id(new Long(1)).build();
        this.account = Account.builder().id(new Long(2)).name("testName").build();
    }

    @Test
    @Override
    public void dto로_변환_test() {

        //given
        Payment payment = Payment.builder()
                .id(id)
                .Order(order)
                .paymentAt(paymentAt)
                .paymentType(paymentType)
                .account(account)
                .build();

        //when
        PaymentDto paymentDto = new PaymentDto().of(payment);


        //then
        Assert.assertEquals(paymentDto.getId() , payment.getId());
        Assert.assertEquals(paymentDto.getPaymentAt() , payment.getPaymentAt());
        Assert.assertEquals(paymentDto.getPaymentType() , payment.getPaymentType());

        Assert.assertEquals(paymentDto.getOrder().getId() , payment.getOrder().getId());
        Assert.assertEquals(paymentDto.getAccount().getId() , payment.getAccount().getId());
    }

    @Test
    @Override
    public void entity로_변환_test() {

        //given
        PaymentDto payment = PaymentDto.builder()
                .id(id)
                .order(new OrderDto().of(order))
                .paymentAt(paymentAt)
                .paymentType(paymentType)
                .account(new AccountDefaultDto(account))
                .build();

        //when
        Payment paymentDto = payment.toEntity();


        //then
        Assert.assertEquals(paymentDto.getId() , payment.getId());
        Assert.assertEquals(paymentDto.getPaymentAt() , payment.getPaymentAt());
        Assert.assertEquals(paymentDto.getPaymentType() , payment.getPaymentType());
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {

        //given
        Payment payment = Payment.builder()
                .id(id)
                .Order(order)
                .paymentAt(paymentAt)
                .paymentType(paymentType)
                .account(account)
                .build();

        //when
        PaymentDto paymentDto = new PaymentDto().of(payment);
        Payment transPayment = paymentDto.toEntity();


        //then
        Assert.assertEquals(transPayment.getId() , payment.getId());
        Assert.assertEquals(transPayment.getPaymentAt() , payment.getPaymentAt());
        Assert.assertEquals(transPayment.getPaymentType() , payment.getPaymentType());
    }
}
