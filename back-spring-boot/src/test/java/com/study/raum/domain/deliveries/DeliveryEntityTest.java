package com.study.raum.domain.deliveries;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * DeliveryEntityTest
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */


@SpringBootTest
@RunWith(SpringRunner.class)
public class DeliveryEntityTest {

    private final static Logger logger = LoggerFactory.getLogger(DeliveryEntityTest.class);

    @Autowired
    private DeliveryRepository deliveryRepository;


    @After
    public void cleanup() {
        this.deliveryRepository.deleteAll();
    }


    @Test
    public void Delivery_Step_Enumerated_저장_테스트() {
        //given
        Delivery.DeliveryStepEnum deliveryStep = Delivery.DeliveryStepEnum.배달지_도착;

        Delivery delivery = Delivery.builder()
                .deliveryStep(deliveryStep)
                .build();

        //when
        Delivery savedDelivery = deliveryRepository.save(delivery);
        String deliveryStepStr = deliveryStep.name();


        //then
        Assert.assertNotNull(savedDelivery.getDeliveryStep());
        Assert.assertEquals(savedDelivery.getDeliveryStep(), delivery.getDeliveryStep());
        Assert.assertEquals(savedDelivery.getDeliveryStep().name(), deliveryStepStr);
    }

}
