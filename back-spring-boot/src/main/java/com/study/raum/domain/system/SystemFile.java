package com.study.raum.domain.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * SystemFiles Domain object
 *
 * @author kuh
 * @since 2020.03.07
 */

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "systemFiles")
public class SystemFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 25)
    private String fileType;

    private String path;

    private double fileSize;

    private String orgFileName;

    private String extension;

    @CreatedDate
    private LocalDateTime regDate;
}
