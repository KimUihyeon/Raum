package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.Delivery;
import com.study.raum.domain.deliveries.DeliveryStaff;
import com.study.raum.domain.orders.Order;
import com.study.raum.dto.orders.OrderDto;
import com.study.raum.dto.orders.OrderDtoTest;
import com.study.raum.setting.util.DateUtil;
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
public class DeliveryDtoTest implements IDtoTest {

    private Long id = new Long(3);

    private Delivery.DeliveryTypeEnum deliveryType = Delivery.DeliveryTypeEnum.방문_조립;
    private Delivery.DeliveryStepEnum deliveryStep = Delivery.DeliveryStepEnum.상품_이동_중; // 배송 단계

    private Timestamp startAt = DateUtil.now(); // 배송시작시간
    private Timestamp arriveAt = DateUtil.now(); // 배송도착시간
    private String deliveryMemo = "delivery Memo"; // 배송 메모

    private DeliveryStaff deliveryStaff; // 배송 대행 회사
    private Order order;

    @Before
    public void init() {
        this.deliveryStaff = DeliveryStaff.builder().id(new Long(1)).build();
        this.order = Order.builder().id(new Long(1)).build();

    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        Delivery delivery = Delivery.builder()
                .id(id)
                .deliveryMemo(deliveryMemo)
                .deliveryStep(deliveryStep)
                .deliveryType(deliveryType)
                .startAt(startAt)
                .arriveAt(arriveAt)
                .deliveryStaff(deliveryStaff)
                .order(order)
                .build();


        //when
        DeliveryDto deliveryDto = new DeliveryDto().of(delivery);


        //then
        Assert.assertEquals(delivery.getId(), deliveryDto.getId());
        Assert.assertEquals(delivery.getDeliveryMemo(), deliveryDto.getDeliveryMemo());
        Assert.assertEquals(delivery.getDeliveryStep(), deliveryDto.getDeliveryStep());
        Assert.assertEquals(delivery.getDeliveryType(), deliveryDto.getDeliveryType());
        Assert.assertEquals(delivery.getArriveAt(), deliveryDto.getArriveAt());
        Assert.assertEquals(delivery.getStartAt(), deliveryDto.getStartAt());

        Assert.assertEquals(delivery.getOrder().getId(), deliveryDto.getOrder().getId());
        Assert.assertEquals(delivery.getDeliveryStaff().getId(), deliveryDto.getDeliveryStaff().getId());
    }


    @Test
    @Override
    public void entity로_변환_test() {
        //given
        DeliveryDto deliveryDto = DeliveryDto.builder()
                .id(id)
                .deliveryMemo(deliveryMemo)
                .deliveryStep(deliveryStep)
                .deliveryType(deliveryType)
                .startAt(startAt)
                .arriveAt(arriveAt)
                .deliveryStaff(new DeliveryStaffDto().of(deliveryStaff))
                .order(new OrderDto().of(order))
                .build();


        //when
        Delivery delivery = deliveryDto.toEntity();


        //then
        Assert.assertEquals(delivery.getId(), deliveryDto.getId());
        Assert.assertEquals(delivery.getDeliveryMemo(), deliveryDto.getDeliveryMemo());
        Assert.assertEquals(delivery.getDeliveryStep(), deliveryDto.getDeliveryStep());
        Assert.assertEquals(delivery.getDeliveryType(), deliveryDto.getDeliveryType());
        Assert.assertEquals(delivery.getArriveAt(), deliveryDto.getArriveAt());
        Assert.assertEquals(delivery.getStartAt(), deliveryDto.getStartAt());

    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        Delivery delivery = Delivery.builder()
                .id(id)
                .deliveryMemo(deliveryMemo)
                .deliveryStep(deliveryStep)
                .deliveryType(deliveryType)
                .startAt(startAt)
                .arriveAt(arriveAt)
                .deliveryStaff(deliveryStaff)
                .order(order)
                .build();


        //when
        DeliveryDto deliveryDto = new DeliveryDto().of(delivery);
        Delivery transDelivery = deliveryDto.toEntity();


        //then
        Assert.assertEquals(delivery.getId(), transDelivery.getId());
        Assert.assertEquals(delivery.getDeliveryMemo(), transDelivery.getDeliveryMemo());
        Assert.assertEquals(delivery.getDeliveryStep(), transDelivery.getDeliveryStep());
        Assert.assertEquals(delivery.getDeliveryType(), transDelivery.getDeliveryType());
        Assert.assertEquals(delivery.getArriveAt(), transDelivery.getArriveAt());
        Assert.assertEquals(delivery.getStartAt(), transDelivery.getStartAt());
    }
}
