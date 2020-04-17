package com.study.raum.dto;

import com.study.raum.domain.system.SystemComponent;
import com.study.raum.dto.common.AbsDtoConverter;
import com.study.raum.dto.common.IDtoConverter;
import lombok.*;

/**
 * @author kuh
 * @since 2020.03.21
 */

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class SystemComponentDTO extends AbsDtoConverter<SystemComponent> {

    private String componentName;
    private String[] urls;
    private boolean isExact;


    public SystemComponentDTO(SystemComponent entity) {
        super(entity);
    }

    @Override
    public SystemComponent toEntity() {

        return SystemComponent.builder()
                .componentName(this.componentName)
                .definitionUrl(String.join(",", this.urls))
                .isExact(this.isExact).build();
    }

    @Override
    public void createDto(SystemComponent entity) {
        this.componentName = entity.getComponentName();
        this.isExact = entity.isExact();

        try {
            this.urls = entity.getDefinitionUrl().split(",");
        } catch (Exception e) {
            this.urls = new String[0];
        }
    }
}
