package com.study.raum.domain.posts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * QnA 질문 답변 응답 Domain Object
 *
 * @author kuh
 * @since 2020.03.08
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(EntityListeners.class)
@Entity
@Table(name = "postsQnA")
public class PostsQnA {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreatedDate
    private LocalDateTime regDate;

    private String question;

    private String contact; // 연락처

    private String contactWay;  // 얀락수단

    @Override
    public String toString() {
        return "PostsQnA{" +
                "id=" + id +
                ", regDate=" + regDate +
                ", question='" + question + '\'' +
                ", contact='" + contact + '\'' +
                ", contactWay='" + contactWay + '\'' +
                '}';
    }
}
