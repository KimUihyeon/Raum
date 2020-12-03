//package com.study.raum.dto;
//
//import com.study.raum.dto.common.AbsDtoConverter;
//import lombok.*;
//
//import java.time.LocalDateTime;
//
///**
// * @author kuh
// * @since 2020.03.08
// */
//@Setter
//@Getter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class PostsFaQDto extends AbsDtoConverter<PostsFaQ> {
//
//    private long id;
//    private String category; //
//    private String answer;
//    private String question;
//    private int hit;
//    private LocalDateTime regDate;
//    private LocalDateTime editDate;
//
//    public PostsFaQDto(PostsFaQ entity){
//        super(entity);
//    }
//
//    @Override
//    public PostsFaQ toEntity() {
//
//        return PostsFaQ.builder()
//                .answer(this.answer)
//                .question(this.question)
//                .hit(this.hit)
//                .build();
//    }
//
//    @Override
//    public void createDto(PostsFaQ entity) {
//        this.id = entity.getId();
//        this.answer = entity.getAnswer();
//        this.question = entity.getQuestion();
//        this.hit = entity.getHit();
//        this.regDate = entity.getRegDate();
//        this.editDate = entity.getEditDate();
//    }
//}
