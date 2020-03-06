package com.study.raum.domain.faq;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * FaQ 자주찾는 질문답변 Domain Object
 *
 * @author kuh
 * @since 20.03.06
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "postFaQ")
public class PostFaQ {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private long faqCategoryId;

    @Column
    private long memberId;

    @Column
    private String answer;

    @Column
    private String question;

    @Column
    private int hit;


}
