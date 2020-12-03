//package com.study.raum.service;
//
//import com.study.raum.domain.members.AccountLevel;
//import com.study.raum.domain.members.AccountLevelRepository;
//import com.study.raum.setting.util.loggers.LoggerUtil;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import javax.transaction.Transactional;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//import java.util.stream.Collectors;
//
///**
// * @author kuh
// * @since 2020.04.15
// */
//
//@SpringBootTest
//@RunWith(SpringRunner.class)
//@Transactional
//public class AccountServiceTest {
//
//    @Autowired
//    private MemberService memberService;
//
//    @Autowired
//    private AccountLevelRepository accountLevelRepository;
//
//    private MemberDto getMemberSample() {
//
//        String uniqUserId = "TestID_" + UUID.randomUUID().toString().substring(0, 7);
//        MemberDto memberDto = new MemberDto();
//        memberDto.setUserId(uniqUserId);
//        memberDto.setAddress1("경기도 수원시 팔달구 권광로 ****");
//        memberDto.setAddress2("떙떙 아파트 123동 33303호");
//        memberDto.setPostNumber("12345");
//        memberDto.setEmailPrefix("떙땡메일");
//        memberDto.setEmailSuffix("gmail.com");
//        memberDto.setName("김뿅뿅");
//        memberDto.setSignupType("직접가입");
//        memberDto.setTel("010-0000-0001");
//        memberDto.setUserPw("1");
//
//        return memberDto;
//    }
//
//    @Test
//    @Rollback
//    public void memberInsertTest() {
//
//        // given
//
//        MemberDto memberDto = getMemberSample();
//
//
//        AccountLevel level = accountLevelRepository.findById(new Long(2)).orElseThrow(() ->
//                new IllegalArgumentException(""));
//
//        memberDto.setMemberLevel(new MemberLevelDto(level));
//
//
//        // when
//        MemberDto savedMember = this.memberService.save(memberDto);
//        MemberDto dbMember = this.memberService.findById(savedMember.getId());
//
//        // then
//        LoggerUtil.sout(memberDto);
//
//        Assert.assertNotNull(savedMember);
//        Assert.assertEquals(savedMember.getName(), memberDto.getName());
//    }
//
//
//    @Test
//    @Rollback
//    public void findAllRelationTest() {
//
//        // given
//        AccountLevel level = accountLevelRepository.findById(new Long(2)).orElseThrow(() ->
//                new IllegalArgumentException(""));
//
//        List<MemberDto> members = new ArrayList<>();
//        for (int i = 0; i < 5; i++) {
//
//            MemberDto member = getMemberSample();
//            member.setMemberLevel(new MemberLevelDto(level));
//            members.add(member);
//        }
//
//        List<Long> savedIds = new ArrayList<>();
//        members.forEach(member-> {
//            MemberDto savedMember = this.memberService.save(member);
//            savedIds.add(savedMember.getId());
//        });
//
//        // when
//        List<MemberDto> memberDto = this.memberService.findAllById(savedIds)
//                .stream()
//                .filter(dto->dto.getMemberLevel() !=null)
//                .collect(Collectors.toList());
//
//
//        // than
//        memberDto.forEach(LoggerUtil::sout);
//        Assert.assertEquals(members.size(), memberDto.size());
//    }
//}
