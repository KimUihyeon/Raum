package com.study.raum.controller;


import com.study.raum.model.Member;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/member/")
public class MemberController {

    @RequestMapping(value="/{id}" , method = RequestMethod.GET)
    public Member getMember(@PathVariable int id){

        Member member = Member.builder()
                                .id(id)
                                .name("test").build();
        return member;
    }

}
