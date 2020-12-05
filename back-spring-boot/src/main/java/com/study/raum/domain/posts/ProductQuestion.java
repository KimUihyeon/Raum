package com.study.raum.domain.posts;

import com.study.raum.domain.members.Account;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * ProductQuestion
 * 상품 문의
 *
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */



@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product_question")
public class ProductQuestion {

    // TODO : 파일첨부 .. 생각해 볼것; (상품 문의)

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private ProductQuestionCategory productQuestionCategory; // 질문항목

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "answer_id")
    private ProductAnswer productAnswer;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Account.class)
    @JoinColumn(name = "account_id")
    private Account account;

    private String title;
    private String context;
    
    private String responseEmail; // 답변 받을 이메일
    private String responsePhoneNumber; // 답변 받을 전화번호

    private Timestamp requestAt;
}
