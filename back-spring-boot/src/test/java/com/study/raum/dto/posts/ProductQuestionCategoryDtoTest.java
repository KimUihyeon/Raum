package com.study.raum.dto.posts;

import com.study.raum.setting.util.test.IDtoTest;
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

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;

    @Override
    public void dto로_변환_test() {

    }

    @Override
    public void entity로_변환_test() {

    }

    @Override
    public void dto로_변환후_entity로_변환_test() {

    }
}
