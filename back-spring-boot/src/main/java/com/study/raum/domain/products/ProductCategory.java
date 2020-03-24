package com.study.raum.domain.products;

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
    @GeneratedValue( strategy =  GenerationType.IDENTITY)
    public long id;

    @Column
    public String name;

    public String etc;
}
