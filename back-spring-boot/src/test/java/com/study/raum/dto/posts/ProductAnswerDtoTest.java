package com.study.raum.dto.posts;

import com.study.raum.dto.members.accounts.AccountDefaultDto;
import com.study.raum.setting.util.test.IDtoTest;
import org.junit.Before;
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

    private Long id;
    private AccountDefaultDto account;

    private String title;
    private String context;

    private boolean isSendEmail; // 이메일로 보냈는지;
    private String sendEmailContext; // 이메일로 보냈는지;

    private boolean isSendMassage; // 문자로 보냈는지;
    private String sendMassageContext; // 문자로 보낸 내용

    private boolean processed; // 처리완료 된 문의

    private Long questionId;

    private Timestamp createAt;
    private Timestamp responseAt;

    //private ProductQuestionDto productQuestion; // 순환참조 문제로 questionId로 대체함.

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
