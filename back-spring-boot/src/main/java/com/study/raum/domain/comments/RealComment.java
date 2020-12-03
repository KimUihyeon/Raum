package com.study.raum.domain.comments;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.system.SystemFile;
import com.study.raum.domain.system.UploadFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 실제 상품 후기
 *
 * @author kuh
 * @since 2020.03.25
 */


@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "realComments")
public class RealComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;

    // TODO : ORDER 테이블 추가 하기

    private int priceScore; // 가격에 대한 점수
    private int qualityScore; // 품질에 대한 점수
    private int deliveryScore; // 배송에 대한 점수

    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp deleteAt;

    private boolean isUse;
    private int hit; // 조회수

    @OneToMany(fetch = FetchType.LAZY , targetEntity = UploadFile.class)
    @JoinColumn(name = "request_id")
    @Builder.Default
    private List<SystemFile> files = new ArrayList<>();

    private long imageFIleId;
}
