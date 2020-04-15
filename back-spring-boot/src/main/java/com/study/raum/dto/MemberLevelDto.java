package com.study.raum.dto;

import com.study.raum.domain.members.MemberLevel;
import com.study.raum.dto.common.IEntityConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

/**
 * @author kuh
 * @since 2020.04.15
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberLevelDto implements IEntityConverter<MemberLevel> {

    private long id;
    private String title;
    private String description;

    public MemberLevelDto(MemberLevel entity){
        this.id = entity.id;
        this.title = entity.title;
        this.description = entity.description;
    }


    @Override
    public MemberLevel toEntity() {
        return MemberLevel.builder()
                .id(this.id)
                .title(this.title)
                .description(this.description)
                .build();
    }
}
