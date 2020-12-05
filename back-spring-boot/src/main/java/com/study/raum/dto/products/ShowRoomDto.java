package com.study.raum.dto.products;

import com.study.raum.domain.products.ShowRoom;
import com.study.raum.domain.products.ShowRoomProduct;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * ShowRoomDto
 *
 * @author Kimuihyeon
 * @since 2020.12.05
 */

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShowRoomDto implements ToConverter<ShowRoom, ShowRoomDto> {

    private Long id;
    private String thumbnailPath; // 썸네일경로
    private String title;
    private String context;

    @Builder.Default
    private List<ShowRoomProductDto> showRoomProducts = new ArrayList<>();

    private double bundlePrice; // 번들 가격
    private double sale;


    @Override
    public ShowRoom toEntity() {
        ShowRoom showRoom = ShowRoom.builder()
                .id(id)
                .thumbnailPath(thumbnailPath)
                .title(title)
                .context(context)
                .bundlePrice(bundlePrice)
                .sale(sale)
                .build();
        return showRoom;
    }

    @Override
    public ShowRoomDto of(ShowRoom showRoom) {
        ShowRoomDto dto = ModelConverter.map(showRoom, ShowRoomDto.class);
        if (dto.getShowRoomProducts() != null && dto.getShowRoomProducts().size() > 0) {
            showRoomProducts = showRoom.getShowRoomProducts()
                    .stream()
                    .map(e-> new ShowRoomProductDto().of(e))
                    .collect(Collectors.toList());
        }
        return dto;
    }
}
