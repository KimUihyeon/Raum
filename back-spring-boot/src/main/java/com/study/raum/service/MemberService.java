package com.study.raum.service;

import com.study.raum.domain.members.Member;
import com.study.raum.domain.members.MemberLevelRepository;
import com.study.raum.domain.members.MemberRepository;
import com.study.raum.dto.MemberDto;
import com.study.raum.service.common.ICommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuh
 * @since 2020.04.15
 */
@Service
@RequiredArgsConstructor
public class MemberService implements ICommonService<MemberDto> {


    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;


    @Override
    public MemberDto save(MemberDto dto) {
        Member member = dto.toEntity();
        Member savedMember = this.memberRepository.save(member);
        return new MemberDto(savedMember);
    }

    @Override
    public MemberDto update(long id, MemberDto dto) {
        return null;
    }

    @Override
    public MemberDto delete(long id) {
        return null;
    }

    @Override
    public List<MemberDto> findAll() {
        return null;
    }

    @Override
    public MemberDto findById(long id) {
        return null;
    }
}
