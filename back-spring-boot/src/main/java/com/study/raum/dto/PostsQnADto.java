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
public class PostQnADto {


    public void toEntity(){

    }

    public PostQnADto(PostsQnA qna){

    }
}
