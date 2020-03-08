package com.study.raum.domain.posts;

import com.study.raum.setting.util.test.IUihyeonJapTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


/**
 * JapRepository Test Class
 *
 * @author kuh
 * @since 2020.03.07
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class PostsFaQRepositoryTest implements IUihyeonJapTest {

    @Resource
    private PostsFaQRepository postsFaQRepository;

    @Override
    @Test
    @Rollback
    public void jpaTest() {
        //given
        List<PostsFaQ> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            PostsFaQ faq = PostsFaQ.builder()
                    .question("질문번호 " + i)
                    .answer("답변번호 " + i)
                    .build();
            collection.add(faq);
        }
        this.postsFaQRepository.saveAll(collection);

        //when
        List<PostsFaQ> postFaQs = this.postsFaQRepository.findAll(Sort.by("id").ascending());
        postFaQs.forEach(t->{
            String testStr = t.getId() + "//" + t.getQuestion() + "//" + t.getAnswer();
            System.out.println(testStr);
        });


        //then
        assertThat(postFaQs).isNotNull();
        assertThat(postFaQs.size()).isEqualTo(collection.size());
    }

}
