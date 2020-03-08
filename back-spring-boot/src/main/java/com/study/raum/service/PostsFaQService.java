package com.study.raum.service;

import com.study.raum.domain.posts.PostsFaQRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Service
@RequiredArgsConstructor
public class PostsFnQService {

    private final PostsFaQRepository;
}
