//package com.study.raum.service;
//
//import com.study.raum.dto.PostsFaQDto;
//import com.study.raum.service.common.BaseCrudService;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.data.domain.Page;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * @author kuh
// * @since 2020.03.08
// */
//
//@Service
//public class PostsFaQService extends BaseCrudService<PostsFaQ, PostsFaQDto> {
//
//    public PostsFaQService(@Qualifier("postsFaQRepository") JpaRepository jpaRepository) {
//        super(jpaRepository);
//    }
//
//    @Override
//    public PostsFaQDto save(PostsFaQDto dto) {
//        return this.entitySave(dto.toEntity());
//    }
//
//    @Override
//    public PostsFaQDto update(long id, PostsFaQDto dto) {
//        PostsFaQ postsFaQ = this.entityFindById(id);
//        postsFaQ.patch(dto.getAnswer(), dto.getQuestion(), dto.getHit());
//        return new PostsFaQDto(postsFaQ);
//    }
//
//    @Override
//    public PostsFaQDto delete(long id) {
//        return entityDelete(id);
//    }
//
//    @Override
//    public Page<PostsFaQDto> findAll(int page, int size) {
//        return this.entityFindAll(page, size);
//    }
//
//    @Override
//    public List<PostsFaQDto> findAll() {
//        return entityFindAll();
//    }
//
//    @Override
//    public List<PostsFaQDto> findAllById(Iterable<Long> ids) {
//        return this.entityFindAllById(ids);
//    }
//
//    @Override
//    public PostsFaQDto findById(long id) {
//        return this.entityFindByIdCastDto(id);
//    }
//}
