package com.study.raum.domain.posts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 * @author kuh
 * @since 2020.03.07
 */
@Component("postsFaQRepository")
public interface PostsFaQRepository extends JpaRepository<PostsFaQ, Long> {
}
