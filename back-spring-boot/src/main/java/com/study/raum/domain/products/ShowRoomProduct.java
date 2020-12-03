package com.study.raum.domain.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

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
@Table(name = "showroomProducts")
public class ShowRoomProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private int x; // x
    private int y; // y 좌표

    private Timestamp createAt;
    private Timestamp deleteAt;
    private Timestamp updateAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "showroom_id")
    private ShowRoom showRoom;

}
