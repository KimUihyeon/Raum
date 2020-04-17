package com.study.raum.service;

import com.study.raum.domain.posts.Posts;
import com.study.raum.domain.posts.PostsRepository;
import com.study.raum.dto.PostsDto;
import com.study.raum.setting.PropertyFileManager;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("postsService")
@RequiredArgsConstructor
@PropertySource(PropertyFileManager.ERROR_MGS_PROP)
public class PostsService  {

    private final PostsRepository postsRepository;

    @Value("${not_find_data}")
    private String NOT_FIND_DATA;

    @Value("${not_find_posts}")
    private String NOT_FIND_POSTS;


    @Transactional
    public PostsDto update(Long id, PostsDto postsDto) {
        Posts posts = this.postsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_DATA));

        posts.patch(postsDto.getTitle(), postsDto.getContent(), postsDto.getAuthor());
        return new PostsDto(posts);
    }

    public PostsDto findById(Long id) {
        Posts posts = this.postsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_POSTS));

        return new PostsDto(posts);
    }

    @Transactional
    public PostsDto save(PostsDto dto) {
        Long id = postsRepository.save(dto.toEntity()).getId();
        PostsDto regDto = null;

        if (id > 0) {
            Posts posts = this.postsRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException(NOT_FIND_POSTS));

            regDto = new PostsDto(posts);
        }
        return regDto;
    }
}
