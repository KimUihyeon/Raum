package com.study.raum.domain.members;

import com.study.raum.setting.util.loggers.LoggerUtil;
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
 * @since 2020.03.08
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberRepositoryTest implements IUihyeonJapTest {
    @Resource
    private MemberRepository memberRepository;

    @Test
    @Rollback
    @Override
    public void jpaTest() {
        //given
        List<Member> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Member member = Member.builder()
                    .address1("경기도 수원시")
                    .address2("팔달구 권광로 231" + i)
                    .postNumber("5514" + i)
                    .userId("userId"+i)
                    .userPw("-----") // Todo: SHA-256 적용하기.
                    .build();

            collection.add(member);
        }
        this.memberRepository.saveAll(collection);

        //when
        List<Member> members = this.memberRepository.findAll(Sort.by("id").descending());
        members.forEach(t->{
            LoggerUtil.sout(t.toString());
        });

        //than
        assertThat(members).isNotNull();
        assertThat(members.size()).isEqualTo(collection.size());
    }
}
