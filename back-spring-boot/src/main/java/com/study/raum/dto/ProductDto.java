//package com.study.raum.dto;
//
//import com.study.raum.domain.products.Product;
//import com.study.raum.dto.common.AbsDtoConverter;
//import com.study.raum.dto.common.IDtoConverter;
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
///**
// * @author kuh
// * @since 2020.04.08
// */
//
//@Data
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//public class ProductDto extends AbsDtoConverter<Product> {
//
//    private long id;
//
//    private String name;
//
//    private long supplierId;
//
//    private ProductCategoryDto productCategory;
//
//    private String thumbnailPath;
//
//    private long memberId;
//
//    private double price;
//
//    private double sale;
//
//    private int hit;
//
//    public ProductDto(Product entity){
//        super(entity);
//    }
//
//
//    @Override
//    public String toString() {
//        return "ProductDto{" +
//                "id=" + id +
//                ", name='" + name + '\'' +
//                ", supplierId=" + supplierId +
//                ", productCategory=" + productCategory +
//                ", thumbnailPath='" + thumbnailPath + '\'' +
//                ", memberId=" + memberId +
//                ", price=" + price +
//                ", sale=" + sale +
//                ", hit=" + hit +
//                '}';
//    }
//
//    @Override
//    public Product toEntity() {
//        return Product.builder()
//                .name(this.name)
//                .hit(this.hit)
//                .id(this.id)
//                .memberId(this.memberId)
//                .supplierId(this.supplierId)
//                .productCategory(this.productCategory == null ? null : this.productCategory.toEntity())
//                .build();
//    }
//
//    @Override
//    public void createDto(Product entity) {
//        this.id = entity.getId();
//        this.name = entity.getName();
//        this.supplierId = entity.getSupplierId();
//        this.thumbnailPath = entity.getThumbnailPath();
//        this.memberId = entity.getMemberId();
//        this.price = entity.getPrice();
//        this.hit = entity.getHit();
//
//        if(entity.getProductCategory() != null){
//            this.productCategory = new ProductCategoryDto(entity.getProductCategory());
//        }
//
//    }
//}
