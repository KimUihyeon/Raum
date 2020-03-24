package com.study.raum.domain.orders;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kuh
 * @since 2020.03.25
 */
public interface PaymentRepository extends JpaRepository<Payment, Long> {
}
