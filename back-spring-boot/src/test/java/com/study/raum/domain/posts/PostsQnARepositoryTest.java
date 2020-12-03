//package com.study.raum.domain.posts;
//
//import com.study.raum.setting.util.loggers.LoggerUtil;
//import com.study.raum.setting.util.test.IUihyeonJapTest;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.data.domain.Sort;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import javax.annotation.Resource;
//import java.util.ArrayList;
//import java.util.List;
//
//
//import static org.assertj.core.api.Assertions.assertThat;
//
///**
// * JapRepository Test Class
// *
// * @author kuh
// * @since 2020.03.08
// */
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class PostsQnARepositoryTest implements IUihyeonJapTest {
//
////    @Resource
////    private PostsQnARepository postsQnARepository;
////
////    @Test
////    @Rollback
////    @Override
////    public void jpaTest() {
////        //given
////        List<PostsQnA> collection = new ArrayList<>();
////        for (int i = 0; i < 10; i++) {
////            String contact;
////            String contactWay;
////
////            if (i % 2 == 0) {
////                contact = "010-0000-000" + i;
////                contactWay = "phone";
////            } else {
////                contact = "email" + i + "@address.com";
////                contactWay = "email";
////            }
////
////            PostsQnA qna = PostsQnA.builder()
////                    .contact(contact)
////                    .contactWay(contactWay)
////                    .build();
////
////            collection.add(qna);
////        }
////        this.postsQnARepository.saveAll(collection);
////
////
////        //when
////        List<PostsQnA> qnas = this.postsQnARepository.findAll(Sort.by("id").descending());
////        qnas.forEach(t -> {
////            LoggerUtil.sout(t.toString());
////        });
////
////        //then
////
////        assertThat(qnas).isNotNull();
////        assertThat(qnas.size()).isEqualTo(collection.size());
////    }
//}
