package com.study.raum.dto.deliveries;

import com.study.raum.domain.deliveries.DeliveryCompany;
import com.study.raum.domain.deliveries.DeliveryStaff;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * DeliveryMan
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */


@SpringBootTest
@RunWith(SpringRunner.class)
public class DeliveryStaffDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String name = "testName";
    private String allocatedArea = "종로구";
    private String grade = "일반사원"; // 직원 평점
    private String phoneNumber = "010-0000-0000"; // 전화 번호
    private DeliveryCompany deliveryCompany;

    @Before
    public void init() {

    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        DeliveryStaff staff = DeliveryStaff.builder()
                .id(id)
                .name(name)
                .grade(grade)
                .allocatedArea(allocatedArea)
                .phoneNumber(phoneNumber)
                .build();

        //when
        DeliveryStaffDto staffDto = new DeliveryStaffDto().of(staff);


        //then
        Assert.assertEquals(staffDto.getId(), staff.getId());
        Assert.assertEquals(staffDto.getName(), staff.getName());
        Assert.assertEquals(staffDto.getGrade(), staff.getGrade());
        Assert.assertEquals(staffDto.getPhoneNumber(), staff.getPhoneNumber());
        Assert.assertEquals(staffDto.getAllocatedArea(), staff.getAllocatedArea());

    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        DeliveryStaffDto staffDto = DeliveryStaffDto.builder()
                .id(id)
                .name(name)
                .grade(grade)
                .allocatedArea(allocatedArea)
                .phoneNumber(phoneNumber)
                .build();

        //when
        DeliveryStaff staff = staffDto.toEntity();

        //then
        Assert.assertEquals(staffDto.getId(), staff.getId());
        Assert.assertEquals(staffDto.getName(), staff.getName());
        Assert.assertEquals(staffDto.getGrade(), staff.getGrade());
        Assert.assertEquals(staffDto.getPhoneNumber(), staff.getPhoneNumber());
        Assert.assertEquals(staffDto.getAllocatedArea(), staff.getAllocatedArea());
    }

    
    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        DeliveryStaff staff = DeliveryStaff.builder()
                .id(id)
                .name(name)
                .grade(grade)
                .allocatedArea(allocatedArea)
                .phoneNumber(phoneNumber)
                .build();

        //when
        DeliveryStaffDto staffDto = new DeliveryStaffDto().of(staff);
        DeliveryStaff transStaff = staffDto.toEntity();


        //then
        Assert.assertEquals(transStaff.getId(), staff.getId());
        Assert.assertEquals(transStaff.getName(), staff.getName());
        Assert.assertEquals(transStaff.getGrade(), staff.getGrade());
        Assert.assertEquals(transStaff.getPhoneNumber(), staff.getPhoneNumber());
        Assert.assertEquals(transStaff.getAllocatedArea(), staff.getAllocatedArea());
    }
}
