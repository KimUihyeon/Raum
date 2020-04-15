package com.study.raum.domain.members;

import com.study.raum.setting.util.loggers.LoggerUtil;
import com.study.raum.setting.util.test.IUihyeonJapTest;
import org.assertj.core.api.Assertions;
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
public class MemberLevelRepositoryTest implements IUihyeonJapTest {

    @Resource
    private MemberLevelRepository memberLevelRepository;

    @Override
    @Test
    public void jpaTest() {
        //given
        List<MemberLevel> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            MemberLevel member = MemberLevel.builder()
                    .description("유저등급 설명 " + i)
                    .title("타이틀" + i)
                    .build();
            collection.add((member));
        }
        this.memberLevelRepository.saveAll(collection);

        //when
        List<MemberLevel> memberLevels = this.memberLevelRepository.findAll(Sort.by("id").descending());
        memberLevels.forEach(t -> {
            String testStr = t.getId() + "//" + t.getTitle() + "//" + t.getDescription();
            LoggerUtil.sout(testStr);
        });

        //than

        Assertions.assertThat(memberLevels).isNotNull();
        assertThat(memberLevels.size()).isEqualTo(collection.size());
    }
}
