package com.study.raum.controller;

import com.study.raum.domain.posts.Posts;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/posts")
public class PostsController {

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public void getPosts(@PathVariable int id){


    }
}
