package com.study.raum.dto;

import com.study.raum.domain.members.Member;
import com.study.raum.dto.common.AbsDtoConverter;
import com.study.raum.dto.common.IDtoConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kuh
 * @since 2020.04.15
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto extends AbsDtoConverter<Member> {


    private String name;

    private long id;

    private String userPw;

    private String userId;

    private String tel;

    private String emailSuffix;

    private String emailPrefix;

    private String address1;

    private String address2;

    private String postNumber;

    private String signupType;

    private MemberLevelDto memberLevel;


    public MemberDto(Member entity){
        super(entity);
    }


    @Override
    public Member toEntity() {
        return Member.builder()
                .userPw(this.userPw)
                .id(this.id)
                .userId(this.userId)
                .tel(this.tel)
                .name(this.name)
                .emailPrefix(this.emailPrefix)
                .emailSuffix(this.emailSuffix)
                .address1(this.address1)
                .address2(this.address2)
                .postNumber(this.postNumber)
                .signupType(this.signupType)
                .memberLevel(this.memberLevel == null ? null : memberLevel.toEntity())
                .build();
    }

    @Override
    public void createDto(Member entity) {
        this.name=entity.getName();
        this.userId = entity.getUserId();
        this.userPw = entity.getUserPw();
        this.tel = entity.getTel();
        this.emailPrefix = entity.getEmailPrefix();
        this.emailSuffix = entity.getEmailSuffix();
        this.address1 = entity.getAddress1();
        this.address2 = entity.getAddress2();
        this.postNumber = entity.getPostNumber();
        this.signupType = entity.getSignupType();

        if(entity.getMemberLevel() != null){
            this.memberLevel = new MemberLevelDto(entity.getMemberLevel());
        }

    }
}
