package com.study.raum.domain.members;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kuh
 * @since 2020.03.08
 */
public interface SupplierRepository extends JpaRepository<Supplier, Long> , SupplierCustomRepository {
}
