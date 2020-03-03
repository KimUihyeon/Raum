package com.study.raum.dto;

import com.study.raum.domain.posts.Posts;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostsDto {

    private String title;
    private String content;
    private String author;

    public Posts toEntity(){

        return Posts.builder()
                    .title(this.title)
                    .content(this.content)
                    .author(this.author)
                    .build();
    }

    public PostsDto (Posts posts){
        this.title = posts.getTitle();
        this.content = posts.getContent();
        this.author = posts.getAuthor();
    }
}
