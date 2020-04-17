package com.study.raum.domain.products;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 * @author kuh
 * @since 2020.03.25
 */

public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Long> {
}
