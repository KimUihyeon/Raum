package com.study.raum.dto.posts;

import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * FaqCategory
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class FaqCategoryDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String description = "test 내용";
    private String name = "어피치";

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        FaqCategory faqCategory = FaqCategory.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when
        FaqCategoryDto faqCategoryDto = new FaqCategoryDto().of(faqCategory);

        //then
        Assert.assertEquals(faqCategoryDto.getId(), faqCategory.getId());
        Assert.assertEquals(faqCategoryDto.getName(), faqCategory.getName());
        Assert.assertEquals(faqCategoryDto.getDescription(), faqCategory.getDescription());
    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        FaqCategoryDto faqCategoryDto = FaqCategoryDto.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when
        FaqCategory faqCategory = faqCategoryDto.toEntity();

        //then
        Assert.assertEquals(faqCategory.getId(), faqCategoryDto.getId());
        Assert.assertEquals(faqCategory.getName(), faqCategoryDto.getName());
        Assert.assertEquals(faqCategory.getDescription(), faqCategoryDto.getDescription());

    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        FaqCategory faqCategory = FaqCategory.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when
        FaqCategoryDto faqCategoryDto = new FaqCategoryDto().of(faqCategory);
        FaqCategory transFaqCategory = faqCategoryDto.toEntity();

        //then
        Assert.assertEquals(transFaqCategory.getId(), faqCategory.getId());
        Assert.assertEquals(transFaqCategory.getName(), faqCategory.getName());
        Assert.assertEquals(transFaqCategory.getDescription(), faqCategory.getDescription());
    }
}
