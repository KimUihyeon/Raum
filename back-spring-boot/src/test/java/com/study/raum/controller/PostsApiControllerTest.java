package com.study.raum.controller;

import com.study.raum.domain.posts.Posts;
import com.study.raum.domain.posts.PostsRepository;
import com.study.raum.dto.PostsDto;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


/**
 * PostsApiController Test Class
 *
 * @author 김의현
 * @since 20.03.03
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class PostsApiControllerTest {

    @LocalServerPort
    private int port;

    @Autowired
    private TestRestTemplate testRestTemplate;

    @Autowired
    private PostsRepository postsRepository;

    @After
    public void tearDown() throws Exception {
        this.postsRepository.deleteAll();
    }

    @Test
    public void getPostsAllList() {

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
        postsList.forEach(t -> System.out.println(t.getTitle()));

        assertThat(postsList.get(0).getTitle()).isEqualTo(title);
        assertThat(postsList.get(0).getContent()).isEqualTo(content);
    }

    @Test
    public void update() throws Exception {
        //given
        Posts newPosts = Posts.builder()
                .title("Test")
                .author("김의현")
                .content("내용")
                .build();

        Posts savedPosts = this.postsRepository.save(newPosts);
        PostsDto dto = new PostsDto(savedPosts);
        dto.setTitle("변경된 제목");
        String url = "http://localhost:" + port + "/api/posts/" + savedPosts.getId();

        //when
        PostsDto responseDto = this.testRestTemplate.patchForObject(url, dto, PostsDto.class);

        //then
        assertThat(responseDto.getTitle()).isEqualTo("변경된 제목");

    }
}
