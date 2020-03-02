package com.study.raum.dto;

import com.study.raum.domain.posts.Posts;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PostsDto {

    private String title;
    private String context;
    private String author;

    public Posts toEntity(){

        return Posts.builder()
                    .title(this.title)
                    .content(this.context)
                    .author(this.author)
                    .build();
    }
}
