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
@Table(name = "showRoom")
public class ShowRoom {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    public long id;
    public long thumbnailPath;
    public String title;
    public double bundlePrice;
}
