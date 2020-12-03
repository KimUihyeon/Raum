//package com.study.raum.controller;
//\
//import com.study.raum.service.PostsFaQService;
//import com.study.raum.service.PostsQnAService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@RequiredArgsConstructor
//@RequestMapping("/api/v1/posts")
//public class PostsApiController {
//
//    private final PostsQnAService postsQnAService;
//    private final PostsFaQService postsFaQService;
//
//    //////////////////////////////////////// Q&A ///////////////////////////////////////////////////
//
//    @GetMapping("/qna")
//    public List<PostsQnADto> getPostsQnaAll() {
//        return this.postsQnAService.findAll();
//    }
//
//    @GetMapping("/qna/{id}")
//    public PostsQnADto getPostsQnaById(@PathVariable long id) {
//        return this.postsQnAService.findById(id);
//    }
//
//    @PatchMapping("/qna/{id}")
//    public PostsQnADto patchPostsQnA(@PathVariable long id, @RequestBody PostsQnADto postsQnADto) {
//        return this.postsQnAService.update(id, postsQnADto);
//    }
//
//    @PostMapping("/qna/{id}")
//    public PostsQnADto savePostsQnA(@PathVariable long id, @RequestBody PostsQnADto postsQnADto) {
//        return this.postsQnAService.update(id, postsQnADto);
//    }
//
//    @DeleteMapping("/qna/{id}")
//    public PostsQnADto deletePostsQnA(@PathVariable long id) {
//        return this.postsQnAService.delete(id);
//    }
//
//
//    //////////////////////////////////////// FAQ ///////////////////////////////////////////////////
//
//
//    @GetMapping("/faq")
//    public List<PostsFaQDto> getPostsFaQAll() {
//        return this.postsFaQService.findAll();
//    }
//
//    @GetMapping("/faq/{id}")
//    public PostsFaQDto getPostsFaQById(@PathVariable long id) {
//        return this.postsFaQService.findById(id);
//    }
//
//    @PostMapping("/faq")
//    public PostsFaQDto savePostsFaQ(@RequestBody PostsFaQDto postsFaQDto) {
//        return this.postsFaQService.save(postsFaQDto);
//    }
//
//    @PatchMapping("/faq/{id}")
//    public PostsFaQDto patchPostsFaQ(@PathVariable long id, @RequestBody PostsFaQDto postsFaQDto) {
//        return this.postsFaQService.update(id, postsFaQDto);
//    }
//
//    @DeleteMapping("/faq/{id}")
//    public PostsFaQDto deletePostsFaQ(@PathVariable long id) {
//        return this.postsFaQService.delete(id);
//    }
//}
