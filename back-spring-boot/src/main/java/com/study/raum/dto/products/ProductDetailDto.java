package com.study.raum.dto.products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ProductDetail;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * ProductDetailDto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@Getter
@Builder
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetailDto implements ToConverter<ProductDetail, ProductDetailDto> {

    public Long id;

    public String objectFileId; // TODO : 3D 파일 Path 작업해주기

    public Timestamp createAt;
    public Timestamp deleteAt;
    public String context;


    @Override
    public ProductDetail toEntity() {

        return ProductDetail.builder()
                .id(id)
                .context(context)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .objectFileId(objectFileId)
                .build();
    }

    @Override
    public ProductDetailDto of(ProductDetail productDetail) {
        return ModelConverter.map(productDetail, ProductDetailDto.class);
    }
}
