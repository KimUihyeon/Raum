package com.study.raum.domain.system;

import com.study.raum.setting.util.loggers.LoggerUtil;
import com.study.raum.setting.util.test.IUihyeonJapTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * JapRepository Test Class
 *
 * @author kuh
 * @since 2020.03.07
 */

@RunWith(SpringRunner.class)
@ActiveProfiles("localDB")
@SpringBootTest
public class SystemMenuRepositoryTest implements IUihyeonJapTest {

    @Resource
    private SystemMenuRepository systemMenuRepository;

    @Override
    @Test
    public void jpaTest() {
        //when
        List<SystemMenu> menus = this.systemMenuRepository.findAll(Sort.by("id").descending());
        menus.forEach(t -> {
            LoggerUtil.sout(t.toString());
        });

        //than

        assertThat(menus).isNotNull();
    }
}
