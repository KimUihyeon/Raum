package com.study.raum.domain.system;

import lombok.*;

import javax.persistence.*;

/**
 * @author kuh
 * @since 2020.03.17
 */


@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "systemComponent")
public class SystemComponent {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private long id;

    @Column( length = 50)
    private String componentName;

    @Column( length = 50)
    private  String definitionUrl;

    private  String etc;

    @Column(columnDefinition = "true")
    private boolean isExact;

    @Column(columnDefinition = "true")
    private  boolean isUsed;

    @Override
    public String toString() {
        return "SystemComponent{" +
                "id=" + id +
                ", componentName='" + componentName + '\'' +
                ", definitionUrl='" + definitionUrl + '\'' +
                ", etc='" + etc + '\'' +
                ", isExact=" + isExact +
                ", isUsed=" + isUsed +
                '}';
    }
}
