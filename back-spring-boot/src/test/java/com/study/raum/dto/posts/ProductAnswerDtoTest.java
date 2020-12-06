package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.ProductAnswer;
import com.study.raum.domain.posts.ProductQuestion;
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
 * ProductAnswer
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductAnswerDtoTest implements IDtoTest {

    private Long id = new Long(1);
    private Account account;

    private String title = "Test title";
    private String context = "test context";

    private boolean isSendEmail = true; // 이메일로 보냈는지;
    private String sendEmailContext = " email 메세지 내용  "; // 이메일로 보냈는지;

    private boolean isSendMassage = true; // 문자로 보냈는지;
    private String sendMassageContext = "문자 메세지 내용"; // 문자로 보낸 내용

    private boolean processed = true; // 처리완료 된 문의

    private Timestamp createAt = DateUtil.now();
    private Timestamp responseAt = DateUtil.now();

    private ProductQuestion productQuestion; // 순환참조 문제로 questionId로 대체함.

    @Before
    public void init() {
        this.account = Account.builder().id(new Long(1)).name("test Name").build();
        this.productQuestion = ProductQuestion.builder().id(new Long(2)).title("test Name2").build();
    }

    @Test
    @Override
    public void dto로_변환_test() {
        // given
        ProductAnswer productAnswer = ProductAnswer.builder()
                .id(id)
                .account(account)
                .title(title)
                .context(context)
                .isSendMassage(isSendMassage)
                .isSendEmail(isSendEmail)
                .sendMassageContext(sendMassageContext)
                .sendEmailContext(sendEmailContext)
                .processed(processed)
                .createAt(createAt)
                .productQuestion(productQuestion)
                .responseAt(responseAt)
                .build();

        // when
        ProductAnswerDto productAnswerDto = new ProductAnswerDto().of(productAnswer);

        // then
        Assert.assertEquals(productAnswerDto.getId(), productAnswer.getId());
        Assert.assertEquals(productAnswerDto.getTitle(), productAnswer.getTitle());
        Assert.assertEquals(productAnswerDto.getContext(), productAnswer.getContext());
        Assert.assertEquals(productAnswerDto.isSendEmail(), productAnswer.isSendEmail());
        Assert.assertEquals(productAnswerDto.getCreateAt(), productAnswer.getCreateAt());
        Assert.assertEquals(productAnswerDto.isProcessed(), productAnswer.isProcessed());
        Assert.assertEquals(productAnswerDto.isSendMassage(), productAnswer.isSendMassage());
        Assert.assertEquals(productAnswerDto.getResponseAt(), productAnswer.getResponseAt());
        Assert.assertEquals(productAnswerDto.getSendMassageContext(), productAnswer.getSendMassageContext());
        Assert.assertEquals(productAnswerDto.getSendEmailContext(), productAnswer.getSendEmailContext());


        Assert.assertEquals(productAnswerDto.getQuestionId(), productAnswer.getProductQuestion().getId()); // 릴레이션
        Assert.assertEquals(productAnswerDto.getAccount().getId(), productAnswer.getAccount().getId());// 릴레이션

    }

    @Test
    @Override
    public void entity로_변환_test() {
        // given
        ProductAnswerDto productAnswerDto = ProductAnswerDto.builder()
                .id(id)
                .account(new AccountDefaultDto(account))
                .title(title)
                .context(context)
                .isSendMassage(isSendMassage)
                .isSendEmail(isSendEmail)
                .sendMassageContext(sendMassageContext)
                .sendEmailContext(sendEmailContext)
                .processed(processed)
                .createAt(createAt)
                .questionId(productQuestion.getId())
                .responseAt(responseAt)
                .build();

        // when
        ProductAnswer productAnswer = productAnswerDto.toEntity();

        // then
        Assert.assertEquals(productAnswer.getId(), productAnswerDto.getId());
        Assert.assertEquals(productAnswer.getTitle(), productAnswerDto.getTitle());
        Assert.assertEquals(productAnswer.getContext(), productAnswerDto.getContext());
        Assert.assertEquals(productAnswer.isSendEmail(), productAnswerDto.isSendEmail());
        Assert.assertEquals(productAnswer.getCreateAt(), productAnswerDto.getCreateAt());
        Assert.assertEquals(productAnswer.isProcessed(), productAnswerDto.isProcessed());
        Assert.assertEquals(productAnswer.isSendMassage(), productAnswerDto.isSendMassage());
        Assert.assertEquals(productAnswer.getResponseAt(), productAnswerDto.getResponseAt());
        Assert.assertEquals(productAnswer.getSendMassageContext(), productAnswerDto.getSendMassageContext());
        Assert.assertEquals(productAnswer.getSendEmailContext(), productAnswerDto.getSendEmailContext());
    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        // given
        ProductAnswer productAnswer = ProductAnswer.builder()
                .id(id)
                .account(account)
                .title(title)
                .context(context)
                .isSendMassage(isSendMassage)
                .isSendEmail(isSendEmail)
                .sendMassageContext(sendMassageContext)
                .sendEmailContext(sendEmailContext)
                .processed(processed)
                .createAt(createAt)
                .productQuestion(productQuestion)
                .responseAt(responseAt)
                .build();

        // when
        ProductAnswerDto productAnswerDto = new ProductAnswerDto().of(productAnswer);
        ProductAnswer transProductAnswer = productAnswerDto.toEntity();

        // then
        Assert.assertEquals(transProductAnswer.getId(), productAnswer.getId());
        Assert.assertEquals(transProductAnswer.getTitle(), productAnswer.getTitle());
        Assert.assertEquals(transProductAnswer.getContext(), productAnswer.getContext());
        Assert.assertEquals(transProductAnswer.isSendEmail(), productAnswer.isSendEmail());
        Assert.assertEquals(transProductAnswer.getCreateAt(), productAnswer.getCreateAt());
        Assert.assertEquals(transProductAnswer.isProcessed(), productAnswer.isProcessed());
        Assert.assertEquals(transProductAnswer.isSendMassage(), productAnswer.isSendMassage());
        Assert.assertEquals(transProductAnswer.getResponseAt(), productAnswer.getResponseAt());
        Assert.assertEquals(transProductAnswer.getSendMassageContext(), productAnswer.getSendMassageContext());
        Assert.assertEquals(transProductAnswer.getSendEmailContext(), productAnswer.getSendEmailContext());

    }
}
