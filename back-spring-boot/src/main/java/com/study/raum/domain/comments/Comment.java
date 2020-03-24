package com.study.raum.domain.comments;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
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
    @GeneratedValue( strategy =  GenerationType.IDENTITY)
    public long id;
    public long commentId;
    public long memberId;
    public int goodScore;
    public int badScore;
    public LocalDateTime regDate;
    public LocalDateTime editDate;
    public LocalDateTime delDate;
}
