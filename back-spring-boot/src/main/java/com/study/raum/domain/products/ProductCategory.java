package com.study.raum.domain.products;

import com.study.raum.dto.ProductCategoryDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "productCategories")
public class ProductCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;

    private String etc;

    public void patch(String name, String etc) {

        if(name != null){
            this.name = name;
        }
        if(etc != null) {
            this.etc = etc;
        }
    }
}
