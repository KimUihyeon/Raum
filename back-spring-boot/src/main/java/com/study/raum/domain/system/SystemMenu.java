package com.study.raum.domain.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * systemMenus Domain Object
 *
 * @author kuh
 * @since 2020.03.07
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "systemMenus")
public class SystemMenu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long parentId;

    private String displayName;

//    private String menuType;

    private String etc;

    private String url;

    @Override
    public String toString() {
        return "SystemMenu{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", displayName='" + displayName + '\'' +
                ", etc='" + etc + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
