package com.study.raum.service;

import com.study.raum.domain.posts.Posts;
import com.study.raum.domain.posts.PostsRepository;
import com.study.raum.dto.PostsDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("postsService")
@RequiredArgsConstructor
public class PostsService {

    private final PostsRepository postsRepository;


    @Transactional
    public PostsDto update(Long id, PostsDto postsDto) {
        Posts posts = this.postsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 데이터 입니다."));

        posts.patch(postsDto.getTitle(), postsDto.getContent(), postsDto.getAuthor());
        return new PostsDto(posts);
    }

    public PostsDto findById(Long id) {
        Posts posts = this.postsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 게시글이 없습니다."));

        return new PostsDto(posts);
    }

    @Transactional
    public PostsDto save(PostsDto dto) {
        Long id = postsRepository.save(dto.toEntity()).getId();
        PostsDto regDto = null;

        if (id > 0) {
            Posts posts = this.postsRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("해당 게시글이 없습니다."));

            regDto = new PostsDto(posts);
        }
        return regDto;
    }
}
