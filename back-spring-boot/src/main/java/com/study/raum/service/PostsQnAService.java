package com.study.raum.service;

import com.study.raum.domain.posts.Posts;
import com.study.raum.domain.posts.PostsQnA;
import com.study.raum.domain.posts.PostsQnARepository;
import com.study.raum.dto.PostsQnADto;
import com.study.raum.service.common.ICommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.03.08
 */
@Service
@RequiredArgsConstructor
public class PostsQnAService implements ICommonService<PostsQnADto> {

    private final PostsQnARepository postsQnARepository;

    @Override
    public List<PostsQnADto> findAll() {
        return this.postsQnARepository.findAll(Sort.by("id").descending()).stream()
                .map(t -> new PostsQnADto(t)).collect(Collectors.toList());
    }

    @Override
    public PostsQnADto delete(long id) {
        PostsQnA qna = this.postsQnARepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시물 입니다."));

        this.postsQnARepository.deleteById(id);
        return new PostsQnADto(qna);
    }

    @Override
    public PostsQnADto save(PostsQnADto postsQnADto) {
        PostsQnA pna = this.postsQnARepository.save(postsQnADto.toEntity());
        return new PostsQnADto(pna);
    }

    @Override
    public PostsQnADto update(long id, PostsQnADto dto) {
        PostsQnA qna = this.postsQnARepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("존재하지 않는 게시물 입니다."));
        qna.patch(dto.getQuestion(), dto.getContact(), dto.getContactWay());

        return new PostsQnADto(qna);
    }

    @Override
    public PostsQnADto findById(long id) {
        PostsQnA dto = this.postsQnARepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("존재하지 않는 게시물 입니다."));

        return new PostsQnADto(dto);
    }
}
