package com.study.raum.domain.products;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kuh
 * @since 2020.03.25
 */
public interface ProductRepository extends JpaRepository<Product, Long> {
}
