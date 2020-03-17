package com.study.raum.service;

import com.study.raum.dto.SystemMenuDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


import java.util.List;

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
@SpringBootTest
public class SystemMenuServiceTest {

    @Autowired
    private SystemMenuService systemMenuService;

    @Test
    public void getListTest() {

        //given
        List<SystemMenuDto> datas = this.systemMenuService.getList();
        //when
        datas.forEach(t -> {
            System.out.println(t.toString());
        });

        //than
        assertThat(datas.size()).isNotZero();
    }
}
