package com.study.raum.dto;

import com.study.raum.domain.posts.PostsQnA;
import lombok.*;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostsQnADto {

    private String question;
    private String contact; // 연락처
    private String contactWay;  // 얀락수단


    public PostsQnA toEntity(){
        PostsQnA qna = PostsQnA.builder()
                .question(this.question)
                .contactWay(this.contactWay)
                .contact(this.contact)
                .build();

        return qna;
    }

    public PostsQnADto(PostsQnA qna){
        this.question = qna.getQuestion();
        this.contact = qna.getContact();
        this.contactWay = qna.getContactWay();
    }
}
