package com.study.raum.domain.products;

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
@Table(name = "showroomProducts")
public class ShowRoomProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;
    public long showroomId;
    public long productId;
    public String url;
    public LocalDateTime regDate;
    public LocalDateTime delDate;

}
