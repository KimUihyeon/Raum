package com.study.raum.domain.posts;

import com.study.raum.domain.members.Account;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * FaqAnswer
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "faq_answer")
public class FaqAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Setter
    @ManyToOne(targetEntity = Account.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;

    @Setter
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "faqAnswer")
    private FaqQuestion faqQuestion;

    private String context;

    private Timestamp createAt;
    private Timestamp updateAt;
}
