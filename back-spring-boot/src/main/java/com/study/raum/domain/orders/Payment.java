package com.study.raum.domain.orders;

import com.study.raum.domain.members.Account;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
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
    public long id;

    public long orderId;

    public String paymentType;

    public LocalDateTime paymentDate;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;

}
