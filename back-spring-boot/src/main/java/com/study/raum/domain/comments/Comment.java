package com.study.raum.domain.comments;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.products.Product;
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
 * 일반 댓글
 *
 * @author kuh
 * @since 2020.03.25
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "comments")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private Comment parent;

    @Builder.Default
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
    private List<Comment> commentId = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Account.class)
    @JoinColumn(name = "account_id")
    private Account account;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;


    @Builder.Default
    @OneToMany(fetch = FetchType.LAZY)
    private List<SystemFile> files = new ArrayList<>();

    private String title;
    private String contents;
    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp deleteAt;

}
