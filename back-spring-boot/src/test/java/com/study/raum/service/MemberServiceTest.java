package com.study.raum.service;

import com.study.raum.domain.members.MemberLevel;
import com.study.raum.domain.members.MemberLevelRepository;
import com.study.raum.dto.MemberDto;
import com.study.raum.dto.MemberLevelDto;
import com.study.raum.setting.util.loggers.LoggerUtil;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.UUID;

/**
 * @author kuh
 * @since 2020.04.15
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class MemberServiceTest {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberLevelRepository memberLevelRepository;

    @Test
    @Rollback
    public void memberInsertTest() {

        // given

        String uniqUserId = "TestID_" + UUID.randomUUID().toString().substring(0,7);
        MemberDto memberDto = new MemberDto();
        memberDto.setUserId(uniqUserId);
        memberDto.setAddress1("경기도 수원시 팔달구 권광로 ****");
        memberDto.setAddress2("떙떙 아파트 123동 33303호");
        memberDto.setPostNumber("12345");
        memberDto.setEmailPrefix("떙땡메일");
        memberDto.setEmailSuffix("gmail.com");
        memberDto.setName("김뿅뿅");
        memberDto.setSignupType("직접가입");
        memberDto.setTel("010-0000-0001");
        memberDto.setUserPw("1");


        MemberLevel level = memberLevelRepository.findById(new Long(2)).orElseThrow(()->
                new  IllegalArgumentException(""));

        memberDto.setMemberLevel(new MemberLevelDto(level));



        // when
        MemberDto savedMember = this.memberService.save(memberDto);

        // then
        LoggerUtil.sout(memberDto);

        Assert.assertNotNull(savedMember);
        Assert.assertEquals(savedMember.getName(), memberDto.getName());

    }
}
