package com.study.raum.dto.members.accounts;

import com.study.raum.domain.members.Account;
import com.study.raum.domain.members.AccountLevel;
import com.study.raum.domain.posts.FaqCategory;
import com.study.raum.dto.posts.FaqCategoryDto;
import com.study.raum.service.common.ToConverter;

import javax.persistence.*;

/**
 * AccountDto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */
public class AccountDto implements ToConverter<Account, AccountDto> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

//    private AccountLevel accountLevel;

    private String userId;
    private String name;
    private String tel;
    private String emailSuffix;
    private String emailPrefix;
    private String address1;
    private String address2;
    private String postNumber;
    private String signupType;


    @Override
    public Account toEntity() {
        return null;
    }

    @Override
    public AccountDto of(Account account) {
        return null;
    }
}
