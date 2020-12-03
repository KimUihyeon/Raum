package com.study.raum.domain.posts;

import com.study.raum.domain.members.Account;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * ProductAnswer
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
public class ProductAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(targetEntity = ProductQuestion.class , mappedBy = "productAnswer" , fetch = FetchType.LAZY)
    private ProductQuestion productQuestion;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Account.class)
    @JoinColumn(name = "account_id")
    private Account account;

    private String title;
    private String context;

    private boolean isSendEmail; // 이메일로 보냈는지;
    private String sendEmailContext; // 이메일로 보냈는지;

    private boolean isSendMassage; // 문자로 보냈는지;
    private String sendMassageContext; // 문자로 보낸 내용

    private boolean processed; // 처리완료 된 문의

}
