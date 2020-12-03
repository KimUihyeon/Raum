package com.study.raum.service.posts;

import com.study.raum.dto.posts.FaqCategoryDto;
import com.study.raum.service.FaqCategoryService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * FaqCategoryServiceTest
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class FaqCategoryServiceTest {

    @Autowired
    private FaqCategoryService faqCategoryService;


    private final Logger logger = LoggerFactory.getLogger(FaqCategoryServiceTest.class);


    @Test
    public void 자주찾는질문_디폴트_항목_저장_Test() {

        //given
        //when
        List<FaqCategoryDto> savedData = this.faqCategoryService.createDefaultList();
        List<FaqCategoryDto> originData = this.faqCategoryService.defaultCategories();
        List<FaqCategoryDto> findData = this.faqCategoryService.defaultCategories();

        //then

        Assert.assertEquals(originData.size(), findData.size());
        Assert.assertEquals(savedData.size(), findData.size());
        for (int i = 0; i < originData.size(); i++) {
            FaqCategoryDto origin = originData.get(i);
            FaqCategoryDto find = findData.get(i);

            logger.debug(find.toString());

            Assert.assertEquals(origin.getDescription(), find.getDescription());
            Assert.assertEquals(origin.getName(), find.getName());
            Assert.assertEquals(origin.getId(), find.getId());
        }
    }
}
