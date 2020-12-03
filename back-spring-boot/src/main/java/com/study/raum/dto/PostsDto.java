//package com.study.raum.dto;
//
//import com.study.raum.dto.common.AbsDtoConverter;
//import lombok.*;
//
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class PostsDto extends AbsDtoConverter<Posts> {
//
//    private String title;
//    private String content;
//    private String author;
//
//    @Override
//    public Posts toEntity(){
//
//        return Posts.builder()
//                    .title(this.title)
//                    .content(this.content)
//                    .author(this.author)
//                    .build();
//    }
//
//    @Override
//    public void createDto(Posts entity) {
//        this.title = entity.getTitle();
//        this.content = entity.getContent();
//        this.author = entity.getAuthor();
//
//    }
//
//    public PostsDto (Posts entity){
//        super(entity);
//    }
//}
