package com.study.raum.domain.posts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * FaQ 자주찾는 질문답변 Domain Object
 *
 * @author kuh
 * @since 20.03.06
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "postsFaQ")
public class PostsFaQ {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private long faqCategoryId;

    @Column
    private long memberId;

    @Column
    private String answer;

    @Column
    private String question;

    @Column
    private int hit;

    @CreatedDate
    private LocalDateTime regDate;

    @LastModifiedDate
    private LocalDateTime editDate;


    public void patch(String answer, String question, int hit) {
        if (this.hit != hit && hit != 0) {
            this.hit = hit;
        }
        if (answer != null) {
            this.answer = answer;
        }
        if (question != null) {
            this.question = question;
        }

    }
}
