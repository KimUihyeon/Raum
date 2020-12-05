package com.study.raum.dto.products;

import com.study.raum.domain.products.Product;
import com.study.raum.dto.members.suppliers.SupplierDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import lombok.*;

/**
 * ProductDto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto implements ToConverter<Product, ProductDto> {

    private Long id;
    private String name;

    private ProductDetailDto detail;        //private ProductDetail productDetail;
    private ProductCategoryDto category;    // private ProductCategory productCategory;
    private SupplierDto supplier;           //private Supplier supplier; // 판매자

    private String thumbnailPath; // 썸네일 주소

    private double price;
    private double sale;
    private int hit;
    private boolean isSell;

    @Override
    public Product toEntity() {
        return Product.builder()
                .id(id)
                .name(name)
                .thumbnailPath(thumbnailPath)
                .price(price)
                .sale(sale)
                .hit(hit)
                .isSell(isSell)
                .build();
    }

    @Override
    public ProductDto of(Product p) {
        ProductDto dto = ModelConverter.map(p, ProductDto.class);
        if (p.getProductCategory() != null) {
            dto.setCategory(new ProductCategoryDto().of(p.getProductCategory()));
        }
        if(p.getProductDetail() != null) {
            dto.setDetail(new ProductDetailDto().of(p.getProductDetail()));
        }
        if(p.getSupplier() != null){
            dto.setSupplier(new SupplierDto().of(p.getSupplier()));
        }
        return dto;
    }
}
