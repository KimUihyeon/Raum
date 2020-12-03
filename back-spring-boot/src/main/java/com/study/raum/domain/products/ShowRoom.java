package com.study.raum.domain.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kuh
 * @since 2020.03.25
 */


@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "showRoom")
public class ShowRoom {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long id;
    private String thumbnailPath; // 썸네일경로

    private String title;
    private String context;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "showRoom")
    private List<ShowRoomProduct> showRoomProducts = new ArrayList<>();

    private double bundlePrice; // 번들 가격
    private double sale;


}
