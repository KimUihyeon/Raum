package com.study.raum.domain.faq;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


/**
 * @author kuh
 * @since 2020.03.07
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class PostFaQCategoryRepositoryTest {

    @Autowired
    private PostFaQCategoryRepository postFaQCategoryRepo;

    @After
    public void cleanup() {
        postFaQCategoryRepo.deleteAll();
    }

    @Test
    @Rollback
    public void createDate() {

        //given
        List<PostFaQCategory> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            PostFaQCategory category = PostFaQCategory.builder()
                                                    .id(i)
                                                    .name("항목 "+String.valueOf(i)).build();
            collection.add(category);
        }

        this.postFaQCategoryRepo.saveAll(collection);

        //when

        List<PostFaQCategory> categories = this.postFaQCategoryRepo.findAll(Sort.by("id").descending());
        categories.forEach(t->{
            String printStr = t.getId() + " // " + t.getName();
            System.out.println(printStr);
        });
        //then
        assertThat(categories).isNotNull();

    }

}
