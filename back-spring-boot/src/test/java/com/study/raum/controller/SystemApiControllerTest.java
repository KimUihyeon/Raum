package com.study.raum.controller;

import com.study.raum.domain.system.SystemMenuRepository;
import com.study.raum.service.SystemMenuService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.restdocs.mockmvc.MockMvcRestDocumentation.document;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;


/**
 * @author kuh
 * @since 2020.03.17
 */


@RunWith(SpringRunner.class)
@WebMvcTest(controllers = SystemApiController.class)
public class SystemApiControllerTest {

    @Autowired
    private MockMvc mvc;

    @MockBean
    private SystemMenuService systemMenuService;

    @MockBean
    private SystemMenuRepository systemMenuRepository;

    @Autowired
    private WebApplicationContext wac;



    @Before
    public void setUp(){
        mvc = MockMvcBuilders.standaloneSetup(wac).build();
    }


    @Test
    public void getListTest() throws Exception {


        systemMenuService.findAll().forEach(t->{
            LoggerUtil.sout(t.getId());
        });
        //given
        //when
        //thanR
        this.mvc.perform(get(   "/api/v1/system/menus"))
                .andDo(print()).andExpect(content().string(""));
    }
}
