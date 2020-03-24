package com.study.raum.domain.comments;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
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
@Table(name = "realComments")
public class RealComment {

    public long id;
    public long memberId;
    public int goodScore;
    public int badScore;
    public LocalDateTime redDate;
    public LocalDateTime editDate;
    public LocalDateTime delDate;
    public boolean isUse;
    public long imageFIleId;
}
