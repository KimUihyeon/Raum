//package com.study.raum.service;
//
//import com.study.raum.domain.products.ProductCategory;
//import com.study.raum.dto.ProductCategoryDto;
//import com.study.raum.dto.ProductDto;
//import com.study.raum.setting.util.loggers.LoggerUtil;
//import org.junit.Assert;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import javax.annotation.Resource;
//import javax.rmi.CORBA.Util;
//import javax.transaction.Transactional;
//import java.util.List;
//
///**
// * @author kuh
// * @since 2020.04.17
// */
//
//@SpringBootTest
//@RunWith(SpringRunner.class)
//@Transactional
//public class ProductCategoryServiceTest {
//
//    @Autowired
//    private ProductCategoryService productCategoryService;
//
//
//    @Test
//    @Before
//    public void cleanAll(){
//
//
//    }
//
//    public void setAll(){
//
//    }
//
//    @Test
//    @Rollback(true)
//    public void saveTest() {
//
//        //given
//        ProductCategoryDto dto = new ProductCategoryDto();
//        dto.setEtc("테스트중 ..!");
//        dto.setName("흠흠흠");
//
//        //when
//        ProductCategoryDto savedCategory = this.productCategoryService.save(dto);
//
//        //that
//
//        LoggerUtil.sout(savedCategory);
//        Assert.assertNotNull(savedCategory);
//    }
//
//    @Test
//    public void findAllTest() {
//        //given
//
//        //when
//        List<ProductCategoryDto> list = this.productCategoryService.findAll();
//
//        //that
//        list.forEach(c -> {
//            LoggerUtil.sout(c);
//        });
//
//        Assert.assertNotNull(list);
//        Assert.assertTrue(list.size() > 0);
//    }
//
//    public void PostsQnAService() {
//
//    }
//}
