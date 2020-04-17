package com.study.raum.service;

import com.study.raum.domain.members.Member;
import com.study.raum.domain.members.MemberRepository;
import com.study.raum.dto.MemberDto;
import com.study.raum.service.common.BaseCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuh
 * @since 2020.04.15
 */
@Service
//@RequiredArgsConstructor
public class MemberService extends BaseCrudService<Member, MemberDto> {

    @Autowired
    public MemberService(MemberRepository memberRepository) {
        super(memberRepository);
    }


    @Override
    public MemberDto save(MemberDto dto) {
        return this.entitySave(dto.toEntity());
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
    public List<MemberDto> findAll(int page, int size) {
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
