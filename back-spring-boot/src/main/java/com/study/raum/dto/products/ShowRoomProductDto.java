package com.study.raum.dto.products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ShowRoom;
import com.study.raum.domain.products.ShowRoomProduct;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * ShowRoomProductDto
 *
 * @author Kimuihyeon
 * @since 2020.12.05
 */
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShowRoomProductDto implements ToConverter<ShowRoomProduct, ShowRoomProductDto> {

    private Long id;
    private int x;
    private int y;
    private Timestamp createAt;
    private Timestamp deleteAt;
    private Timestamp updateAt;

    private ProductDto product;

    @Deprecated
    private ShowRoomDto showRoom;// 순환참조로 비활성화

    @Override
    public ShowRoomProduct toEntity() {
        return ShowRoomProduct.builder()
                .id(id)
                .x(x)
                .y(y)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .build();
    }

    @Override
    public ShowRoomProductDto of(ShowRoomProduct s) {
        ShowRoomProductDto dto = ModelConverter.map(s, ShowRoomProductDto.class);
        if (s.getProduct() != null) {
            //dto.setShowRoom(new ShowRoomDto().of(s.getProduct())); // 순환참조 주의
            dto.setProduct(new ProductDto().of(s.getProduct()));
        }
        return dto;
    }
}
