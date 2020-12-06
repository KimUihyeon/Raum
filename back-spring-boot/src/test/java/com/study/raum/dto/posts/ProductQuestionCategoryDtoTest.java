package com.study.raum.dto.posts;

import com.study.raum.domain.posts.ProductQuestionCategory;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * ProductQuestionCategory
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductQuestionCategoryDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String name = "test Name";
    private String description = "description Test";

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        ProductQuestionCategory productQuestionCategory = ProductQuestionCategory.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when

        ProductQuestionCategoryDto productQuestionCategoryDto = new ProductQuestionCategoryDto().of(productQuestionCategory);

        //then
        Assert.assertEquals(productQuestionCategoryDto.getId(),  productQuestionCategory.getId());
        Assert.assertEquals(productQuestionCategoryDto.getName(),  productQuestionCategory.getName());
        Assert.assertEquals(productQuestionCategoryDto.getDescription(),  productQuestionCategory.getDescription());
    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        ProductQuestionCategoryDto productQuestionCategoryDto = ProductQuestionCategoryDto.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when

        ProductQuestionCategory productQuestionCategory = productQuestionCategoryDto.toEntity();

        //then
        Assert.assertEquals(productQuestionCategory.getId(),  productQuestionCategoryDto.getId());
        Assert.assertEquals(productQuestionCategory.getName(),  productQuestionCategoryDto.getName());
        Assert.assertEquals(productQuestionCategory.getDescription(),  productQuestionCategoryDto.getDescription());
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        ProductQuestionCategory productQuestionCategory = ProductQuestionCategory.builder()
                .id(id)
                .name(name)
                .description(description)
                .build();

        //when

        ProductQuestionCategoryDto productQuestionCategoryDto = new ProductQuestionCategoryDto().of(productQuestionCategory);
        ProductQuestionCategory transProductQuestionCategory = productQuestionCategoryDto.toEntity();

        //then
        Assert.assertEquals(transProductQuestionCategory.getId(),  productQuestionCategory.getId());
        Assert.assertEquals(transProductQuestionCategory.getName(),  productQuestionCategory.getName());
        Assert.assertEquals(transProductQuestionCategory.getDescription(),  productQuestionCategory.getDescription());
    }
}
