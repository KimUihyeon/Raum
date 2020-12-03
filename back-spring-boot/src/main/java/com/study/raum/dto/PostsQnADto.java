//package com.study.raum.dto;
//
//import com.study.raum.dto.common.AbsDtoConverter;
//import lombok.*;
//
///**
// * @author kuh
// * @since 2020.03.08
// */
//
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class PostsQnADto extends AbsDtoConverter<PostsQnA> {
//
//    private String question;
//    private String contact; // 연락처
//    private String contactWay;  // 얀락수단
//
//    @Override
//    public PostsQnA toEntity() {
//        PostsQnA qna = PostsQnA.builder()
//                .question(this.question)
//                .contactWay(this.contactWay)
//                .contact(this.contact)
//                .build();
//
//        return qna;
//    }
//
//    @Override
//    public void createDto(PostsQnA entity) {
//        this.question = entity.getQuestion();
//        this.contact = entity.getContact();
//        this.contactWay = entity.getContactWay();
//    }
//
//    public PostsQnADto(PostsQnA entity) {
//        super(entity);
//    }
//}
