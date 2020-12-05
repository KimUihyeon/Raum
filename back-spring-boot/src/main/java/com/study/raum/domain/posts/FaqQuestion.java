package com.study.raum.domain.posts;

import com.study.raum.domain.members.Account;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * FaqQuestion
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "faq_question")
public class FaqQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(targetEntity = Account.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = FaqCategory.class)
    @JoinColumn(name = "faq_category_id")
    private FaqCategory faqCategory;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faq_answer_id")
    private FaqAnswer faqAnswer;

    private String context;

    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp deleteAt;
    private int hit;
}
