package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.DeliveryCompany;
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
 * DeliveryCompany
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class DeliveryCompanyDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String add1 = "서울특별시 종로구";
    private String add2 = "종로대로 1234";
    private String add3 = "땡떙빌딩 1502호";
    private String postNumber = "1234";
    private String companyName = "김 땡떙"; // 대표 이름
    private String managerName = "김 매니저"; // 대표 성명
    private String managerPhone = "010-0000-0000";  // 대표 연락처
    private Timestamp contractAt = DateUtil.now(); // 업체 계약일
    private boolean isUse = true; // 거래 중인 업체인지.

//    private List<DeliveryStaffDto> staffs = new ArrayList<>(); // 순환참조로 사용하지 않음

    @Before
    public void init() {

    }

    @Test
    public void dto로_변환_test() {
        //given
        DeliveryCompany deliveryCompany = DeliveryCompany.builder()
                .id(id)
                .add1(add1)
                .add2(add2)
                .add3(add3)
                .isUse(isUse)
                .companyName(companyName)
                .postNumber(postNumber)
                .managerName(managerName)
                .managerPhone(managerPhone)
                .contractAt(contractAt)
                .build();

        //when
        DeliveryCompanyDto deliveryCompanyDto = new DeliveryCompanyDto().of(deliveryCompany);

        //then
        Assert.assertEquals(deliveryCompany.getId(), deliveryCompanyDto.getId());
        Assert.assertEquals(deliveryCompany.getAdd1(), deliveryCompanyDto.getAdd1());
        Assert.assertEquals(deliveryCompany.getAdd2(), deliveryCompanyDto.getAdd2());
        Assert.assertEquals(deliveryCompany.getAdd3(), deliveryCompanyDto.getAdd3());
        Assert.assertEquals(deliveryCompany.isUse(), deliveryCompanyDto.isUse());
        Assert.assertEquals(deliveryCompany.getCompanyName(), deliveryCompanyDto.getCompanyName());
        Assert.assertEquals(deliveryCompany.getManagerName(), deliveryCompanyDto.getManagerName());
        Assert.assertEquals(deliveryCompany.getManagerPhone(), deliveryCompanyDto.getManagerPhone());
        Assert.assertEquals(deliveryCompany.getContractAt(), deliveryCompanyDto.getContractAt());

    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        DeliveryCompanyDto deliveryCompanyDto = DeliveryCompanyDto.builder()
                .id(id)
                .add1(add1)
                .add2(add2)
                .add3(add3)
                .isUse(isUse)
                .companyName(companyName)
                .postNumber(postNumber)
                .managerName(managerName)
                .managerPhone(managerPhone)
                .contractAt(contractAt)
                .build();

        //when
        DeliveryCompany deliveryCompany = deliveryCompanyDto.toEntity();

        //then
        Assert.assertEquals(deliveryCompany.getId(), deliveryCompanyDto.getId());
        Assert.assertEquals(deliveryCompany.getAdd1(), deliveryCompanyDto.getAdd1());
        Assert.assertEquals(deliveryCompany.getAdd2(), deliveryCompanyDto.getAdd2());
        Assert.assertEquals(deliveryCompany.getAdd3(), deliveryCompanyDto.getAdd3());
        Assert.assertEquals(deliveryCompany.isUse(), deliveryCompanyDto.isUse());
        Assert.assertEquals(deliveryCompany.getCompanyName(), deliveryCompanyDto.getCompanyName());
        Assert.assertEquals(deliveryCompany.getManagerName(), deliveryCompanyDto.getManagerName());
        Assert.assertEquals(deliveryCompany.getManagerPhone(), deliveryCompanyDto.getManagerPhone());
        Assert.assertEquals(deliveryCompany.getContractAt(), deliveryCompanyDto.getContractAt());
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        DeliveryCompany deliveryCompany = DeliveryCompany.builder()
                .id(id)
                .add1(add1)
                .add2(add2)
                .add3(add3)
                .isUse(isUse)
                .companyName(companyName)
                .postNumber(postNumber)
                .managerName(managerName)
                .managerPhone(managerPhone)
                .contractAt(contractAt)
                .build();

        //when
        DeliveryCompanyDto deliveryCompanyDto = new DeliveryCompanyDto().of(deliveryCompany);
        DeliveryCompany transDeliveryCompany = deliveryCompanyDto.toEntity();

        //then
        Assert.assertEquals(deliveryCompany.getId(), transDeliveryCompany.getId());
        Assert.assertEquals(deliveryCompany.getAdd1(), transDeliveryCompany.getAdd1());
        Assert.assertEquals(deliveryCompany.getAdd2(), transDeliveryCompany.getAdd2());
        Assert.assertEquals(deliveryCompany.getAdd3(), transDeliveryCompany.getAdd3());
        Assert.assertEquals(deliveryCompany.isUse(), transDeliveryCompany.isUse());
        Assert.assertEquals(deliveryCompany.getCompanyName(), transDeliveryCompany.getCompanyName());
        Assert.assertEquals(deliveryCompany.getManagerName(), transDeliveryCompany.getManagerName());
        Assert.assertEquals(deliveryCompany.getManagerPhone(), transDeliveryCompany.getManagerPhone());
        Assert.assertEquals(deliveryCompany.getContractAt(), transDeliveryCompany.getContractAt());

    }
}
