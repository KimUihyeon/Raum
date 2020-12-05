package com.study.raum.dto.posts;

import com.study.raum.domain.posts.FaqAnswer;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import java.sql.Timestamp;

/**
 * FaqAnswer
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FaqAnswerDto implements ToConverter<FaqAnswer, FaqAnswerDto> {
    private Long id;

    private String context;
    private Timestamp createAt;
    private Timestamp updateAt;

    private AccountDefaultDto account;

    private Long questionId;

    //private FaqQuestionDto faqQuestion; // 순환참조 문제로 questionId로 대체함.

    @Override
    public FaqAnswer toEntity() {
        return FaqAnswer.builder()
                .id(id)
                .context(context)
                .createAt(createAt)
                .updateAt(updateAt)
                .build();
    }

    @Override
    public FaqAnswerDto of(FaqAnswer a) {
        FaqAnswerDto dto = ModelConverter.map(a, FaqAnswerDto.class);
        if (a.getAccount() != null) {
            dto.setAccount(new AccountDefaultDto(a.getAccount()));
        }
        if(a.getFaqQuestion() != null){
            dto.setQuestionId(a.getFaqQuestion().getId());
        }
        return dto;
    }
}
