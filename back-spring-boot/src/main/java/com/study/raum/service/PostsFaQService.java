package com.study.raum.service;

import com.study.raum.domain.posts.PostsFaQ;
import com.study.raum.domain.posts.PostsFaQRepository;
import com.study.raum.dto.PostsFaQDto;
import com.study.raum.service.common.IServiceBase;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Service
@RequiredArgsConstructor
public class PostsFaQServiceBase implements IServiceBase<PostsFaQDto> {

    private final PostsFaQRepository postsFaQRepository;

    @Override
    public PostsFaQDto save(PostsFaQDto dto) {
        return new PostsFaQDto(this.postsFaQRepository.save(dto.toEntity()));
    }

    @Override
    public PostsFaQDto update(long id, PostsFaQDto dto) {
        PostsFaQ postsFaQ = this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다."));
        postsFaQ.patch(dto.getAnswer(), dto.getQuestion(), dto.getHit());
        return new PostsFaQDto(postsFaQ);
    }

    @Override
    public PostsFaQDto delete(long id) {
        PostsFaQ postsFaQ = this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다."));

        this.postsFaQRepository.delete(postsFaQ);

        return new PostsFaQDto(postsFaQ);
    }

    @Override
    public List<PostsFaQDto> findAll(int page, int size) {
        return this.postsFaQRepository.findAll(PageRequest.of(page, size))
                .stream().map(t -> new PostsFaQDto(t)).collect(Collectors.toList());
    }

    @Override
    public List<PostsFaQDto> findAll() {
        return this.postsFaQRepository.findAll(Sort.by("id"))
                .stream().map(t -> new PostsFaQDto(t)).collect(Collectors.toList());
    }

    @Override
    public PostsFaQDto findById(long id) {
        return new PostsFaQDto(this.postsFaQRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시판 입니다.")));
    }
}
