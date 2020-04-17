package com.study.raum.dto;

import com.study.raum.domain.system.SystemMenu;
import com.study.raum.dto.common.AbsDtoConverter;
import com.study.raum.dto.common.IDtoConverter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kuh
 * @since 2020.03.17
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SystemMenuDto extends AbsDtoConverter<SystemMenu> {

    private long id;
    private List<SystemMenuDto> children = new ArrayList<>();
    private String name;
    private String url;
    private String etc;


    public SystemMenuDto(SystemMenu entity){
        super(entity);
    }

    @Override
    public SystemMenu toEntity(){
        return SystemMenu.builder()
                .id(this.getId())
                .displayName(this.getName())
                .etc(this.etc)
                .url(this.url)
                .build();
    }

    @Override
    public void createDto(SystemMenu entity) {
        this.url = entity.getUrl();
        this.id = entity.getId();
        this.name = entity.getDisplayName();
        this.etc = entity.getEtc();
    }

    @Override
    public String toString() {
        return "SystemMenuDto{" +
                "id=" + id +
                ", children=" + children +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", etc='" + etc + '\'' +
                '}';
    }
}
