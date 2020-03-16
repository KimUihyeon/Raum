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
@Table(name = "SystemComponent")
public class SystemComponent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //private Long parentMenuId;

    private String displayName;

    private String menuType;

    private String componentName;

    private String definitionUrl;

    private String etc;

    private String url;

    private boolean isMenu;

    @Override
    public String toString() {
        return "SystemComponent{" +
                "id=" + id +
                ", displayName='" + displayName + '\'' +
                ", menuType='" + menuType + '\'' +
                ", componentName='" + componentName + '\'' +
                ", definitionUrl='" + definitionUrl + '\'' +
                ", etc='" + etc + '\'' +
                ", url='" + url + '\'' +
                ", isMenu=" + isMenu +
                '}';
    }
}
