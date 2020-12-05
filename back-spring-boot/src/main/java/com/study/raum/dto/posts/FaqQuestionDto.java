package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.domain.posts.FaqQuestion;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * FaqQuestion
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqQuestionDto implements ToConverter<FaqQuestion, FaqQuestionDto> {

    private Long id;
    private AccountDefaultDto account;
    private String context;
    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp deleteAt;
    private int hit;

    private FaqCategoryDto faqCategory;
    private FaqAnswerDto faqAnswer;

    @Override
    public FaqQuestion toEntity() {
        return FaqQuestion.builder()
                .id(id)
                .updateAt(updateAt)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .context(context)
                .hit(hit)
                .build();
    }

    @Override
    public FaqQuestionDto of(FaqQuestion q) {
        FaqQuestionDto dto = ModelConverter.map(q, FaqQuestionDto.class);
        if (q.getFaqAnswer() != null) {
            dto.setFaqAnswer(new FaqAnswerDto().of(q.getFaqAnswer()));
        }
        if (q.getFaqCategory() != null) {
            dto.setFaqCategory(new FaqCategoryDto().of(q.getFaqCategory()));
        }
        return dto;
    }
}
