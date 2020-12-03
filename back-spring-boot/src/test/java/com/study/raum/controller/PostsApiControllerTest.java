//package com.study.raum.controller;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.web.servlet.MockMvc;
//
//import static org.assertj.core.api.Assertions.assertThat;
//import static org.springframework.restdocs.mockmvc.MockMvcRestDocumentation.document;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
//
//
///**
// * @author kuh
// * @since 2020.03.08
// */
//
//@RunWith(SpringRunner.class)
//@WebMvcTest(  controllers = ProductsApiController.class)
//@AutoConfigureRestDocs
//public class PostsApiControllerTest {
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    @Test
//    public void urlTest() throws Exception {
//        //given
//
//
//        //when
//
//
//        //that
//        mockMvc.perform(get("/api/v1/products/"))
//                .andDo(print())
//                .andDo(document("products"))
//                .andExpect(jsonPath("$.name").value("test"));
//    }
//}
