package com.study.raum.domain.orders;

import com.study.raum.domain.members.Account;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Setter
    @OneToOne
    private Order Order;

    private String paymentType;

    private Timestamp paymentAt;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;

}
