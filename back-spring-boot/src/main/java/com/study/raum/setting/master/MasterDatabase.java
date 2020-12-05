package com.study.raum.setting.master;

import com.study.raum.service.FaqCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * MasterDatabase
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@Component
public class MasterDatabase {

    @Autowired
    private FaqCategoryService faqCategoryService;

    private final Logger logger = LoggerFactory.getLogger(MasterDatabase.class);

    public void create(){
        try{
            this.faqCategoryService.createDefaultList();
        }catch (Exception e){
            e.printStackTrace();
            logger.error("faqCategoryService.defaultCategories() || 문제 발생");
        }
    }
}
