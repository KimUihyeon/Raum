package com.study.raum.domain.comments;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 실제 상품 후기
 *
 * @author kuh
 * @since 2020.03.25
 */
public interface RealCommentRepository extends JpaRepository<RealComment, Long> {
}
