package com.study.raum.controller;

import com.study.raum.model.Member;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.transaction.AfterTransaction;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
// 이부분 추가하셔야 합니다.
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@WebMvcTest(controllers = MemberController.class)
public class MemberControllerTest {

    @Autowired
    private MockMvc mock;

    @Test
    @Rollback
    public void TestMethod() throws Exception{

        mock.perform(get("/api/member/3"))
                .andDo(print())
                .andExpect(content().string(("{\"id\":3,\"name\":\"test\",\"tel\":null,\"email\":null}")))
                .andExpect(jsonPath("$.id").value(3));
    }
}
