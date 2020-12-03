package com.study.raum.service;

import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.domain.posts.FaqCategoryRepository;
import com.study.raum.dto.posts.FaqCategoryDto;
import com.study.raum.service.common.BaseCrudService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * FaqCategoryService
 * 자주 찾는 질문 카테고리
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
@Service
public class FaqCategoryService extends BaseCrudService<FaqCategory, FaqCategoryDto, Long> {

    private FaqCategoryRepository faqCategoryRepository;

    public FaqCategoryService(FaqCategoryRepository faqCategoryRepository) {
        super(faqCategoryRepository, LoggerFactory.getLogger(FaqCategoryService.class));
        this.faqCategoryRepository = faqCategoryRepository;
    }

    public List<FaqCategoryDto> defaultCategories() {

        ArrayList<FaqCategoryDto> categories = new ArrayList<>();
        categories.add(FaqCategoryDto.builder().id(1).name("회원 관련").description("회원 정보 관련 문의").build());
        categories.add(FaqCategoryDto.builder().id(2).name("주문/결제").description("주문 결제시 문의").build());
        categories.add(FaqCategoryDto.builder().id(3).name("반품/교환/AS").description("반품 교환 AS 전반에 관한 문의").build());
        categories.add(FaqCategoryDto.builder().id(4).name("상품").description("상품 관련 질문 문의").build());
        categories.add(FaqCategoryDto.builder().id(5).name("배송").description("배송 관련 문의").build());
        categories.add(FaqCategoryDto.builder().id(6).name("기타").description("기타 문의").build());
        return categories;
    }

    public List<FaqCategoryDto> createDefaultList() {
        List<FaqCategory> faqCategories = this.defaultCategories()
                .stream()
                .map(e-> e.toEntity())
                .collect(Collectors.toList());

        return this.jpaRepository.saveAll(faqCategories)
                .stream()
                .map(e-> new FaqCategoryDto().of(e))
                .collect(Collectors.toList());
    }

    private List<FaqCategoryDto> listAll(){
        return this.jpaRepository.findAll(Sort.by("id").ascending())
                .stream()
                .map(e-> new FaqCategoryDto().of(e))
                .collect(Collectors.toList());
    }
}
