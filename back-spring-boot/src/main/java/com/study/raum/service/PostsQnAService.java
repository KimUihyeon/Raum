package com.study.raum.service;

import com.study.raum.domain.posts.PostsQnA;
import com.study.raum.domain.posts.PostsQnARepository;
import com.study.raum.dto.PostsQnADto;
import com.study.raum.service.common.BaseCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuh
 * @since 2020.03.08
 */
@Service
public class PostsQnAService extends BaseCrudService<PostsQnA, PostsQnADto> {


    @Autowired
    public PostsQnAService(PostsQnARepository postsQnARepository) {
        super(postsQnARepository);
    }

    @Override
    public List<PostsQnADto> findAll() {
        return entityFindAll();
    }

    @Override
    public List<PostsQnADto> findAllById(Iterable<Long> ids) {
        return this.entityFindAllById(ids);
    }

    @Override
    public PostsQnADto delete(long id) {
        return entityDelete(id);
    }

    @Override
    public Page<PostsQnADto> findAll(int page, int size) {
        return entityFindAll(page, size);
    }

    @Override
    public PostsQnADto save(PostsQnADto dto) {
        return entitySave(dto.toEntity());
    }

    @Override
    public PostsQnADto update(long id, PostsQnADto dto) {
        PostsQnA qna = this.entityFindById(id);
        qna.patch(dto.getQuestion(), dto.getContact(), dto.getContactWay());

        return new PostsQnADto(qna);
    }

    @Override
    public PostsQnADto findById(long id) {
        return this.entityFindByIdCastDto(id);
    }
}
