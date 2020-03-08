package com.study.raum.service;

import com.study.raum.domain.posts.PostsFaQ;
import com.study.raum.domain.posts.PostsFaQRepository;
import com.study.raum.dto.PostsFaQDto;
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
public class PostsFaQService {

    private final PostsFaQRepository postsFaQRepository;

    @Transactional
    public PostsFaQDto save(PostsFaQDto postsFaQDto) {
        return new PostsFaQDto(this.postsFaQRepository.save(postsFaQDto.toEntity()));
    }

    @Transactional
    public PostsFaQDto update(Long id, PostsFaQDto postsFaQDto) {
        PostsFaQ postsFaQ = this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다."));
        postsFaQ.patch(postsFaQDto.getAnswer(), postsFaQDto.getQuestion(), postsFaQDto.getHit());
        return new PostsFaQDto(postsFaQ);
    }

    @Transactional
    public PostsFaQDto delete(long id) {
        PostsFaQ postsFaQ = this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다."));

        this.postsFaQRepository.delete(postsFaQ);

        return new PostsFaQDto(postsFaQ);
    }

    public List<PostsFaQDto> findAll() {
        return this.postsFaQRepository.findAll(Sort.by("id").descending())
                .stream().map(t -> new PostsFaQDto(t)).collect(Collectors.toList());
    }

    public PostsFaQDto findById(long id) {
        return new PostsFaQDto(this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다.")));
    }
}
