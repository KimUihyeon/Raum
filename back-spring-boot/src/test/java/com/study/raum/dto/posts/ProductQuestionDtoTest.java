package com.study.raum.dto.posts;

import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Before;
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

    private Long id;
    private ProductQuestionCategoryDtoTest questionCategory; // 질문항목
    private ProductAnswerDtoTest answer; // 답안
    private AccountDefaultDto account;

    private String title;
    private String context;

    private String responseEmail; // 답변 받을 이메일
    private String responsePhoneNumber; // 답변 받을 전화번호

    private Timestamp requestAt;

    @Before
    public void init(){

    }

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
