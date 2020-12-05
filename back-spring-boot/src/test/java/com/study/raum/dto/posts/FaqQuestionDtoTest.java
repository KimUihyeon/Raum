package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.FaqAnswer;
import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.domain.posts.FaqQuestion;
import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.setting.util.DateUtil;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Timestamp;

/**
 * FaqQuestion
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class FaqQuestionDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private String context = "test 내용";
    private Timestamp createAt = DateUtil.now();
    private Timestamp updateAt = DateUtil.now();
    private Timestamp deleteAt = DateUtil.now();
    private int hit = 388;

    private Account account;
    private FaqCategory faqCategory;
    private FaqAnswer faqAnswer;

    @Before
    public void init() {
        this.account = Account.builder().id(new Long(3)).build();
        this.faqAnswer = FaqAnswer.builder().id(new Long(5)).build();
        this.faqCategory = FaqCategory.builder().id(new Long(4)).build();
    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        FaqQuestion faqQuestion = FaqQuestion.builder()
                .id(id)
                .hit(hit)
                .context(context)
                .account(account)
                .faqAnswer(faqAnswer)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .build();

        //when
        FaqQuestionDto faqQuestionDto = new FaqQuestionDto().of(faqQuestion);

        //then
        Assert.assertEquals(faqQuestion.getId(), faqQuestionDto.getId());
        Assert.assertEquals(faqQuestion.getHit(), faqQuestionDto.getHit());
        Assert.assertEquals(faqQuestion.getContext(), faqQuestionDto.getContext());
        Assert.assertEquals(faqQuestion.getDeleteAt(), faqQuestionDto.getDeleteAt());
        Assert.assertEquals(faqQuestion.getUpdateAt(), faqQuestionDto.getUpdateAt());
        Assert.assertEquals(faqQuestion.getCreateAt(), faqQuestionDto.getCreateAt());

        Assert.assertEquals(faqQuestion.getFaqAnswer().getId(), faqQuestionDto.getFaqAnswer().getId());
        Assert.assertEquals(faqQuestion.getAccount().getName(), faqQuestionDto.getAccount().getName());

    }

    @Test
    @Override
    public void entity로_변환_test() {
        //given
        FaqQuestionDto faqQuestionDto = FaqQuestionDto.builder()
                .id(id)
                .hit(hit)
                .context(context)
                .account(new AccountDefaultDto(account))
                .faqAnswer(new FaqAnswerDto().of(faqAnswer))
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .build();

        //when
        FaqQuestion faqQuestion = faqQuestionDto.toEntity();

        //then
        Assert.assertEquals(faqQuestion.getId(), faqQuestionDto.getId());
        Assert.assertEquals(faqQuestion.getHit(), faqQuestionDto.getHit());
        Assert.assertEquals(faqQuestion.getContext(), faqQuestionDto.getContext());
        Assert.assertEquals(faqQuestion.getDeleteAt(), faqQuestionDto.getDeleteAt());
        Assert.assertEquals(faqQuestion.getUpdateAt(), faqQuestionDto.getUpdateAt());
        Assert.assertEquals(faqQuestion.getCreateAt(), faqQuestionDto.getCreateAt());

    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        FaqQuestion faqQuestion = FaqQuestion.builder()
                .id(id)
                .hit(hit)
                .context(context)
                .account(account)
                .faqAnswer(faqAnswer)
                .createAt(createAt)
                .deleteAt(deleteAt)
                .updateAt(updateAt)
                .build();

        //when
        FaqQuestionDto faqQuestionDto = new FaqQuestionDto().of(faqQuestion);
        FaqQuestion transFaqQuestion = faqQuestionDto.toEntity();


        //then
        Assert.assertEquals(faqQuestion.getId(), transFaqQuestion.getId());
        Assert.assertEquals(faqQuestion.getHit(), transFaqQuestion.getHit());
        Assert.assertEquals(faqQuestion.getContext(), transFaqQuestion.getContext());
        Assert.assertEquals(faqQuestion.getDeleteAt(), transFaqQuestion.getDeleteAt());
        Assert.assertEquals(faqQuestion.getUpdateAt(), transFaqQuestion.getUpdateAt());
        Assert.assertEquals(faqQuestion.getCreateAt(), transFaqQuestion.getCreateAt());

    }
}
