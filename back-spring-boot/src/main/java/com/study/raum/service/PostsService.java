package com.study.raum.service;

import com.study.raum.domain.posts.PostsRepository;
import com.study.raum.dto.PostsDto;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.Resources;

@Service
@RequiredArgsConstructor
public class PostsService {

    private final PostsRepository postsRepository;


    public Long save(PostsDto dto){
        return postsRepository.save(dto.toEntity()).getId();
    }
}
