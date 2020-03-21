package com.study.raum.dto;

import com.study.raum.domain.system.SystemComponent;
import lombok.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author kuh
 * @since 2020.03.21
 */

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class SystemComponentDTO {

    private String componentName;
    private String[] urls;
    private boolean isExact;


    public SystemComponentDTO(SystemComponent entity) {
        this.componentName = entity.getComponentName();
        this.isExact = entity.isExact();

        try {
            this.urls = entity.getDefinitionUrl().split(",");
        } catch (Exception e) {
            this.urls = new String[0];
        }
    }
}
