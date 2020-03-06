package com.study.raum.controller;

import com.study.raum.dto.PostsDto;
import com.study.raum.service.PostsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/posts")
public class PostsApiController {

    private final PostsService postsService;

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public PostsDto save(@RequestBody PostsDto postsDto){
        return this.postsService.save(postsDto);
    }

    @RequestMapping(value = "/{id}" , method = RequestMethod.GET)
    public PostsDto findById(@PathVariable Long id){
        return this.postsService.findById(id);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.PATCH)
    public PostsDto update(@PathVariable Long id, @RequestBody PostsDto postsDto){
        return this.postsService.update(id,postsDto);
    }

}
