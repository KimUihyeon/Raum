package com.study.raum.domain;

import com.study.raum.domain.posts.Posts;
import com.study.raum.domain.posts.PostsRepository;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import static org.assertj.core.api.Assertions.*;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PostsRepositoryTest {

    @Autowired
    private PostsRepository postsRepository;


    @After
    public void cleanup(){
        this.postsRepository.deleteAll();
    }


    @Test
    public void getPostsAllList(){

        String title = "테스트 게시글";
        String content = "테스트 본문";

        // given
        this.postsRepository.save(Posts.builder()
                                    .title(title)
                                    .content(content)
                                    .author("5")
                                    .build());

        // when
        List<Posts> postsList = this.postsRepository.findAll();

        // then
        postsList.forEach(t-> System.out.println(t.getTitle()));

        assertThat(postsList.get(0).getTitle()).isEqualTo(title);
        assertThat(postsList.get(0).getContent()).isEqualTo(content);
    }
}
