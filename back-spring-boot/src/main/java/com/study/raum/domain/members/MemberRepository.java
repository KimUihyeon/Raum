package com.study.raum.domain.members;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 *
 * @author kuh
 * @since 2020.03.08
 */

public interface MemberRepository extends JpaRepository<Member, Long> {
}
