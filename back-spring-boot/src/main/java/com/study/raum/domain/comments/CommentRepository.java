package com.study.raum.domain.comments;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kuh
 * @since 2020.03.25
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
}
