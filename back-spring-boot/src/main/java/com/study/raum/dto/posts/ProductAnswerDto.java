package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.ProductAnswer;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * ProductAnswer
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductAnswerDto implements ToConverter<ProductAnswer, ProductAnswerDto> {

    private Long id;
    private AccountDefaultDto account;

    private String title;
    private String context;

    private boolean isSendEmail; // 이메일로 보냈는지;
    private String sendEmailContext; // 이메일로 보냈는지;

    private boolean isSendMassage; // 문자로 보냈는지;
    private String sendMassageContext; // 문자로 보낸 내용

    private boolean processed; // 처리완료 된 문의

    private Long questionId;

    private Timestamp createAt;
    private Timestamp responseAt;

    //private ProductQuestionDto productQuestion; // 순환참조 문제로 questionId로 대체함.

    @Override
    public ProductAnswer toEntity() {
        return ProductAnswer.builder()
                .id(id)
                .title(title)
                .context(context)
                .isSendEmail(isSendEmail)
                .isSendMassage(isSendMassage)
                .sendEmailContext(sendEmailContext)
                .sendMassageContext(sendMassageContext)
                .processed(processed)
                .createAt(createAt)
                .responseAt(responseAt)
                .build();
    }

    @Override
    public ProductAnswerDto of(ProductAnswer a) {
        ProductAnswerDto dto = ModelConverter.map(a, ProductAnswerDto.class);
        if (a.getAccount() != null) {
            dto.setAccount(new AccountDefaultDto(a.getAccount()));
        }
        if (a.getProductQuestion() != null){
            dto.setQuestionId(a.getProductQuestion().getId());
        }
        return dto;
    }
}
