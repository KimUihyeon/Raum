package com.study.raum.logic;

import com.study.raum.domain.posts.FaqCategoryRepository;
import com.study.raum.service.FaqCategoryService;
import com.study.raum.setting.master.MasterDatabase;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * MasterDatabaseTest
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class MasterDatabaseTest {

    @Autowired
    private MasterDatabase masterDatabase;

    @Autowired
    private FaqCategoryRepository faqCategoryRepository;
    @Autowired
    private FaqCategoryService faqCategoryService;

    @Test
    public void 마스터데이터_순차_삽입_Test() {
        //given
        this.masterDatabase.create();
        //when
        int masterDataSize = this.faqCategoryRepository.findAll().size();
        int originSize = this.faqCategoryService.defaultCategories().size();

        //then
        Assert.assertEquals(masterDataSize, originSize);
    }
}
