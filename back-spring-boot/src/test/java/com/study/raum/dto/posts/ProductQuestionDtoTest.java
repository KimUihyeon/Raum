package com.study.raum.dto.posts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.posts.ProductAnswer;
import com.study.raum.domain.posts.ProductQuestion;
import com.study.raum.domain.posts.ProductQuestionCategory;
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
 * ProductQuestion
 * 상품 문의
 *
 * @author Kimuihyeon
 * @since 2020.12.02
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ProductQuestionDtoTest implements IDtoTest {

    // TODO : 파일첨부 .. 생각해 볼것; (상품 문의)

    private Long id = new Long(1);

    private String title = "test Title";
    private String context = "test context";

    private String responseEmail = "test@test.com"; // 답변 받을 이메일
    private String responsePhoneNumber = "010-1111-1111"; // 답변 받을 전화번호

    private Timestamp requestAt = DateUtil.now();

    private ProductQuestionCategory questionCategory; // 질문항목
    private ProductAnswer answer; // 답안
    private Account account;

    @Before
    public void init() {
        this.questionCategory = ProductQuestionCategory.builder()
                .id(new Long(1))
                .build();

        this.answer = ProductAnswer.builder()
                .id(new Long(2))
                .build();

        this.account = Account.builder()
                .id(new Long(3))
                .name("test Name")
                .nickname("test nickName")
                .build();
    }

    @Test
    @Override
    public void dto로_변환_test() {
        //given
        ProductQuestion productQuestion = ProductQuestion.builder()
                .id(id)
                .title(title)
                .context(context)
                .responsePhoneNumber(responsePhoneNumber)
                .responseEmail(responseEmail)
                .requestAt(requestAt)
                .account(account)
                .productAnswer(answer)
                .productQuestionCategory(questionCategory)
                .build();

        //when
        ProductQuestionDto productQuestiondto = new ProductQuestionDto().of(productQuestion);


        //then
        Assert.assertEquals(productQuestion.getId(), productQuestiondto.getId());
        Assert.assertEquals(productQuestion.getTitle(), productQuestiondto.getTitle());
        Assert.assertEquals(productQuestion.getContext(), productQuestiondto.getContext());
        Assert.assertEquals(productQuestion.getResponsePhoneNumber(), productQuestiondto.getResponsePhoneNumber());
        Assert.assertEquals(productQuestion.getResponseEmail(), productQuestiondto.getResponseEmail());
        Assert.assertEquals(productQuestion.getRequestAt(), productQuestiondto.getRequestAt());

        Assert.assertEquals(productQuestion.getAccount().getName(), productQuestiondto.getAccount().getName()); //릴레이션
        Assert.assertEquals(productQuestion.getProductAnswer().getId(), productQuestiondto.getAnswer().getId()); //릴레이션
        Assert.assertEquals(productQuestion.getProductQuestionCategory().getId(), productQuestiondto.getQuestionCategory().getId()); //릴레이션
    }

    @Test
    @Override
    public void entity로_변환_test() {

        //given
        ProductQuestionDto productQuestionDto = ProductQuestionDto.builder()
                .id(id)
                .title(title)
                .context(context)
                .responsePhoneNumber(responsePhoneNumber)
                .responseEmail(responseEmail)
                .requestAt(requestAt)
                .account(new AccountDefaultDto(account))
                .answer(new ProductAnswerDto().of(answer))
                .questionCategory(new ProductQuestionCategoryDto().of(questionCategory))
                .build();

        //when
        ProductQuestion productQuestion = productQuestionDto.toEntity();


        //then
        Assert.assertEquals(productQuestion.getId(), productQuestionDto.getId());
        Assert.assertEquals(productQuestion.getTitle(), productQuestionDto.getTitle());
        Assert.assertEquals(productQuestion.getContext(), productQuestionDto.getContext());
        Assert.assertEquals(productQuestion.getResponsePhoneNumber(), productQuestionDto.getResponsePhoneNumber());
        Assert.assertEquals(productQuestion.getResponseEmail(), productQuestionDto.getResponseEmail());
        Assert.assertEquals(productQuestion.getRequestAt(), productQuestionDto.getRequestAt());

    }

    @Test
    @Override
    public void dto로_변환후_entity로_변환_test() {
        //given
        ProductQuestion productQuestion = ProductQuestion.builder()
                .id(id)
                .title(title)
                .context(context)
                .responsePhoneNumber(responsePhoneNumber)
                .responseEmail(responseEmail)
                .requestAt(requestAt)
                .account(account)
                .productAnswer(answer)
                .productQuestionCategory(questionCategory)
                .build();

        //when
        ProductQuestionDto productQuestionDto = new ProductQuestionDto().of(productQuestion);
        ProductQuestion transProductQuestion = productQuestionDto.toEntity();

        //then
        Assert.assertEquals(productQuestion.getId(), transProductQuestion.getId());
        Assert.assertEquals(productQuestion.getTitle(), transProductQuestion.getTitle());
        Assert.assertEquals(productQuestion.getContext(), transProductQuestion.getContext());
        Assert.assertEquals(productQuestion.getResponsePhoneNumber(), transProductQuestion.getResponsePhoneNumber());
        Assert.assertEquals(productQuestion.getResponseEmail(), transProductQuestion.getResponseEmail());
        Assert.assertEquals(productQuestion.getRequestAt(), transProductQuestion.getRequestAt());

    }
}
