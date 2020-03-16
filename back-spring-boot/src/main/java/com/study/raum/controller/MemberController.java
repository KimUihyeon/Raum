package com.study.raum.controller;


import com.study.raum.model.Member;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/member/")
public class MemberController {

    @RequestMapping(value="/{id}" , method = RequestMethod.GET)
    public Member getMember(@PathVariable int id){

        Member member = Member.builder()
                                .id(id)
                                .name("test").build();
        return member;
    }

}
