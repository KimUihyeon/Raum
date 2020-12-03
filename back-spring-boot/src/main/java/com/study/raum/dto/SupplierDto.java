package com.study.raum.dto;

import com.study.raum.domain.members.Supplier;
import com.study.raum.dto.common.AbsDtoConverter;
import lombok.*;

/**
 * @author kuh
 * @since 2020.04.17
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SupplierDto extends AbsDtoConverter<Supplier> {

    private String temp;

    public SupplierDto(Supplier entity) {
        super(entity);
    }

    @Override
    public Supplier toEntity() {
        return null;
    }

    @Override
    public void createDto(Supplier entity) {

    }
}
