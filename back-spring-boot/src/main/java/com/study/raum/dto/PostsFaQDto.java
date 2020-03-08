package com.study.raum.dto;

import com.study.raum.domain.posts.PostsFaQ;
import lombok.*;

import java.time.LocalDateTime;

/**
 * @author kuh
 * @since 2020.03.08
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostsFaQDto {

    private long id;
    private String category; //
    private String answer;
    private String question;
    private int hit;
    private LocalDateTime regDate;
    private LocalDateTime editDate;

    public PostsFaQDto(PostsFaQ postsFaQ){
        this.id = postsFaQ.getId();
        this.answer = postsFaQ.getAnswer();
        this.question = postsFaQ.getQuestion();
        this.hit = postsFaQ.getHit();
        this.regDate = postsFaQ.getRegDate();
        this.editDate = postsFaQ.getEditDate();
    }

    public PostsFaQ toEntity() {

        return PostsFaQ.builder()
                .answer(this.answer)
                .question(this.question)
                .hit(this.hit)
                .build();
    }
}
