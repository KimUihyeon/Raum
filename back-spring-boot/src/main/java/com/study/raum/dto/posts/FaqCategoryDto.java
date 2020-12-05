package com.study.raum.dto.posts;

import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

/**
 * FaqCategory
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqCategoryDto implements ToConverter<FaqCategory, FaqCategoryDto> {

    private Long id;
    private String description;
    private String name;


    @Override
    public FaqCategory toEntity() {
        return FaqCategory.builder()
                .description(description)
                .name(name)
                .id(id)
                .build();
    }

    @Override
    public FaqCategoryDto of(FaqCategory faqCategory) {
        return ModelConverter.map(faqCategory, FaqCategoryDto.class);
    }

    @Override
    public String toString() {
        return "FaqCategoryDto{" +
                "  id=" + id +
                ", description='" + description + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
