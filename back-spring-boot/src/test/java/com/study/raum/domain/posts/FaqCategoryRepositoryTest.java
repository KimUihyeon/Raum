package com.study.raum.domain.posts;

import com.study.raum.setting.util.loggers.LoggerUtil;
import com.study.raum.setting.util.test.IUihyeonJapTest;
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
 * JapRepository Test Class
 *
 * @author kuh
 * @since 2020.03.07
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class FaqCategoryRepositoryTest implements IUihyeonJapTest {


    @Test
    public void name() {
    }

    @Override
    @Test
    @Rollback
    public void jpaTest() {

        //given
        List<FaqCategory> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            FaqCategory category = FaqCategory.builder()
                    .id(new Long(i))
                    .name("항목 " + String.valueOf(i)).build();
            collection.add(category);
        }

    }

}
