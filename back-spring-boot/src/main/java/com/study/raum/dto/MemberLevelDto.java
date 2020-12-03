//package com.study.raum.dto;
//
//import com.study.raum.domain.members.AccountLevel;
//import com.study.raum.dto.common.AbsDtoConverter;
//import lombok.*;
//
///**
// * @author kuh
// * @since 2020.04.15
// */
//
//@Setter
//@Getter
//@AllArgsConstructor
//@NoArgsConstructor
//public class MemberLevelDto extends AbsDtoConverter<AccountLevel> {
//
//    private long id;
//    private String title;
//    private String description;
//
//    public MemberLevelDto(AccountLevel entity){
//        super(entity);
//    }
//
//
//    @Override
//    public AccountLevel toEntity() {
//        return AccountLevel.builder()
//                .id(this.id)
//                .title(this.title)
//                .description(this.description)
//                .build();
//    }
//
//    @Override
//    public void createDto(AccountLevel entity) {
//        this.id = entity.id;
//        this.title = entity.title;
//        this.description = entity.description;
//    }
//}
