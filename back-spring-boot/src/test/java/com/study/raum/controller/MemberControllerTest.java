package com.study.raum.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.raum.model.Member;
import org.json.JSONObject;
import org.junit.Assert;
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


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.assertj.core.api.Assertions.*;

@RunWith(SpringRunner.class)
@WebMvcTest(controllers = MemberController.class)
public class MemberControllerTest {

    @Autowired
    private MockMvc mock;

    @Test
    @Rollback
    public void MvcTest() throws Exception{

        Member member = new Member();
        member.setName("test");
        member.setId(3);

        ObjectMapper mapper = new ObjectMapper();
        String memberSerializeStr = mapper.writeValueAsString(member);

        mock.perform(get("/api/member/3"))
                .andDo(print())
                .andExpect(content().string(memberSerializeStr))
                .andExpect(jsonPath("$.id").value(3));
    }

    @Test
    public void MvcJsonTest() throws Exception {
        int memberID = 2;

        Member member = Member.builder()
                                .id(memberID)
                                .name("김의현")
                                .build();


        mock.perform(get("/api/member/" + memberID))
                .andDo(print())
                .andExpect(jsonPath("$.id").value(memberID));
    }

    @Test
    public void objectTest() throws Exception {

        Member member = new Member();
        member.setName("test");
        String data = String.valueOf(member.getName());



        assertThat(member).isNotNull();
    }
}
