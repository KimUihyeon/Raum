package com.study.raum.domain.posts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * FaQ 자주찾는 질문답변 카테고리 Domain Object
 *
 * @author kuh
 * @since 20.03.06
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "faq_category")
public class FaqCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name; // 카테고리명
    private String description; // 설명


    public void patch(FaqCategory faqCategory){
        if(this.name == null || !this.name.equals(faqCategory.getName())){
            this.name = faqCategory.getName();
        }
        if(this.description == null || !this.description.equals(faqCategory.getDescription())){
            this.name = faqCategory.getDescription();
        }
    }
}
