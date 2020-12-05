package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.FaqAnswer;
import com.study.raum.domain.posts.FaqQuestion;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.DateUtil;
import com.study.raum.setting.util.data.ModelConverter;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Timestamp;

/**
 * FaqAnswer
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class FaqAnswerDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String context = "Test 내용";
    private Timestamp createAt = DateUtil.now();
    private Timestamp updateAt = DateUtil.now();

    private Long accountId = new Long(2);
    private String name = "홍길동"; // 성명
    private String userId = "test@test.com"; // 계정
    private String nickName = "라이언";

    private Account account;

    private FaqQuestion faqQuestion; // 순환참조 문제로 questionId로 대체함.

    @Before
    public void init() {
        this.account = Account.builder()
                .userId(userId)
                .nickname(nickName)
                .name(name)
                .id(accountId)
                .build();

        this.faqQuestion = FaqQuestion.builder()
                .id(new Long(4))
                .build();
    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        FaqAnswer faqAnswer = FaqAnswer.builder()
                .id(id)
                .faqQuestion(faqQuestion)
                .context(context)
                .updateAt(updateAt)
                .createAt(createAt)
                .account(account)
                .build();

        //when
        FaqAnswerDto faqAnswerDto = new FaqAnswerDto().of(faqAnswer);

        //then
        Assert.assertEquals(faqAnswer.getId(), faqAnswerDto.getId());
        Assert.assertEquals(faqAnswer.getContext(), faqAnswerDto.getContext());
        Assert.assertEquals(faqAnswer.getUpdateAt(), faqAnswerDto.getUpdateAt());
        Assert.assertEquals(faqAnswer.getCreateAt(), faqAnswerDto.getCreateAt());

        Assert.assertEquals(faqAnswer.getAccount().getName(), faqAnswerDto.getAccount().getName()); // 릴레이션 객체 비교
        Assert.assertEquals(faqAnswer.getFaqQuestion().getId(), faqAnswerDto.getQuestionId()); // 릴레이션 객체 비교 (순환참조 이슈)
    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        FaqAnswerDto faqAnswerDto = FaqAnswerDto.builder()
                .id(id)
                .questionId(faqQuestion.getId())
                .context(context)
                .updateAt(updateAt)
                .createAt(createAt)
                .account(new AccountDefaultDto(account))
                .build();

        //when
        FaqAnswer faqAnswer = faqAnswerDto.toEntity();

        //then
        Assert.assertEquals(faqAnswer.getId(), faqAnswerDto.getId());
        Assert.assertEquals(faqAnswer.getContext(), faqAnswerDto.getContext());
        Assert.assertEquals(faqAnswer.getUpdateAt(), faqAnswerDto.getUpdateAt());
        Assert.assertEquals(faqAnswer.getCreateAt(), faqAnswerDto.getCreateAt());
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        FaqAnswer faqAnswer = FaqAnswer.builder()
                .id(id)
                .faqQuestion(faqQuestion)
                .context(context)
                .updateAt(updateAt)
                .createAt(createAt)
                .account(account)
                .build();

        //when
        FaqAnswerDto faqAnswerDto = new FaqAnswerDto().of(faqAnswer);
        FaqAnswer transFaqAnswer = faqAnswerDto.toEntity();

        //then
        Assert.assertEquals(faqAnswer.getId(), transFaqAnswer.getId());
        Assert.assertEquals(faqAnswer.getContext(), transFaqAnswer.getContext());
        Assert.assertEquals(faqAnswer.getUpdateAt(), transFaqAnswer.getUpdateAt());
        Assert.assertEquals(faqAnswer.getCreateAt(), transFaqAnswer.getCreateAt());

    }
}
