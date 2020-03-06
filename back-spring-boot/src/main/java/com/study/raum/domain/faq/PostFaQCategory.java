package com.study.raum.domain.faq;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * FaQ 자주찾는 질문답변 카테고리 Domain Object
 *
 * @author kuh
 * @since 20.03.06
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "postFaQCategories")
public class PostFaQCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;
}
