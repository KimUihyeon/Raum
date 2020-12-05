package com.study.raum.dto.posts;

import com.study.raum.domain.posts.ProductQuestionCategory;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;

/**
 * ProductQuestionCategory
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductQuestionCategoryDto implements ToConverter<ProductQuestionCategory, ProductQuestionCategoryDto> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;

    @Override
    public ProductQuestionCategory toEntity() {
        return ProductQuestionCategory.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();
    }

    @Override
    public ProductQuestionCategoryDto of(ProductQuestionCategory qc) {
        return ModelConverter.map(qc, ProductQuestionCategoryDto.class);
    }
}
