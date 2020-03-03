package com.study.raum.domain.posts;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
public class Posts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 500, nullable = false)
    private String title;

    @Column(columnDefinition = "Text", nullable = false)
    private String content;

    private String author;


    @Builder // 생성자에 선언시 파라미테어 있는 필드만 빌더 생
    public Posts(String title, String content, String author){
        this.title = title;
        this.content = content;
        this.author = author;
    }

    public void patch(String title, String content, String author){
        if(title != null){
            this.title = title;
        }
        if(content != null){
            this.title = content;
        }
        if(author != null){
            this.title = author;
        }
    }


}
