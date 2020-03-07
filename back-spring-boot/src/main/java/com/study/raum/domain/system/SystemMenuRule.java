package com.study.raum.domain.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * systemMenuRule Domain Object
 *
 * @author kuh
 * @since 2020.03.07
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "systemMenuRules")
public class SystemMenuRule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long menuId;

    private Long menuLevelId;
}
