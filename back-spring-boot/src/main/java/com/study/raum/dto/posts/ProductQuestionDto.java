package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.ProductQuestion;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * ProductQuestion
 * 상품 문의
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductQuestionDto implements ToConverter<ProductQuestion, ProductQuestionDto> {

    // TODO : 파일첨부 .. 생각해 볼것; (상품 문의)

    private Long id;
    private ProductQuestionCategoryDto questionCategory; // 질문항목
    private ProductAnswerDto answer; // 답안
    private AccountDefaultDto account;

    private String title;
    private String context;

    private String responseEmail; // 답변 받을 이메일
    private String responsePhoneNumber; // 답변 받을 전화번호

    private Timestamp requestAt;

    @Override
    public ProductQuestion toEntity() {
        return ProductQuestion.builder()
                .id(id)
                .title(title)
                .context(context)
                .responseEmail(responseEmail)
                .responsePhoneNumber(responsePhoneNumber)
                .requestAt(requestAt)
                .build();
    }

    @Override
    public ProductQuestionDto of(ProductQuestion q) {
        ProductQuestionDto dto = ModelConverter.map(q, ProductQuestionDto.class);
        if (q.getAccount() != null) {
            dto.setAccount(new AccountDefaultDto(q.getAccount()));
        }
        if (q.getProductAnswer() != null) {
            dto.setAnswer(new ProductAnswerDto().of(q.getProductAnswer()));
        }
        if (q.getProductQuestionCategory() != null) {
            dto.setQuestionCategory(new ProductQuestionCategoryDto().of(q.getProductQuestionCategory()));
        }
        return dto;
    }
}
