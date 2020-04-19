package com.study.raum.service;

import com.study.raum.domain.members.Member;
import com.study.raum.domain.members.MemberRepository;
import com.study.raum.dto.MemberDto;
import com.study.raum.service.common.BaseCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    public Page<MemberDto> findAll(int page, int size) {
        return this.entityFindAll(page, size);
    }

    @Override
    public List<MemberDto> findAll() {
        return this.entityFindAll();
    }

    @Override
    public List<MemberDto> findAllById(Iterable<Long> ids) {
        return this.entityFindAllById(ids);
    }

    @Override
    public MemberDto findById(long id) {
        return this.entityFindByIdCastDto(id);
    }
}
