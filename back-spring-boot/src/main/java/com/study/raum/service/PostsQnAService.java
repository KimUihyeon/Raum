package com.study.raum.service;

import com.study.raum.domain.posts.PostsQnA;
import com.study.raum.domain.posts.PostsQnARepository;
import com.study.raum.dto.PostsQnADto;
import com.study.raum.service.common.BaseCrudService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
    public PostsQnADto delete(long id) {
        return entityDelete(id);
    }

    @Override
    public List<PostsQnADto> findAll(int page, int size) {
        return entityFindAll();
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
