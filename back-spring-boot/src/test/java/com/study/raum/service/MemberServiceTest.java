package com.study.raum.service;

import com.study.raum.domain.members.Member;
import com.study.raum.dto.MemberDto;
import com.study.raum.setting.util.loggers.LoggerUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author kuh
 * @since 2020.04.15
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class MemberServiceTest {

    @Autowired
    private MemberService memberService;

    @Test
    @Rollback
    public void memberInsertTest(){

        // given
        MemberDto memberDto = new MemberDto();
        memberDto.setAddress1("경기도 수원시 팔달구 권광로 ****");
        memberDto.setAddress2("떙떙 아파트 123동 33303호");
        memberDto.setPostNumber("12345");
        memberDto.setEmailPrefix("떙땡메일");
        memberDto.setEmailSuffix("gmail.com");
        memberDto.setName("김뿅뿅");
        memberDto.setSignupType("직접가입");
        memberDto.setTel("010-0000-0001");
        memberDto.setUserId("test");
        memberDto.setUserPw("1");


        // when
        MemberDto savedMember =this.memberService.save(memberDto);

        // then
        LoggerUtil.sout(memberDto);

    }
}
