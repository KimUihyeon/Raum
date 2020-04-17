package com.study.raum.dto;

import com.study.raum.domain.members.MemberLevel;
import com.study.raum.dto.common.AbsDtoConverter;
import com.study.raum.dto.common.IDtoConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kuh
 * @since 2020.04.15
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberLevelDto extends AbsDtoConverter<MemberLevel> {

    private long id;
    private String title;
    private String description;

    public MemberLevelDto(MemberLevel entity){
        super(entity);
    }


    @Override
    public MemberLevel toEntity() {
        return MemberLevel.builder()
                .id(this.id)
                .title(this.title)
                .description(this.description)
                .build();
    }

    @Override
    public void createDto(MemberLevel entity) {
        this.id = entity.id;
        this.title = entity.title;
        this.description = entity.description;
    }
}
