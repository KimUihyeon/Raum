package com.study.raum.dto.members.accounts;

import com.study.raum.domain.members.Account;
import com.study.raum.service.common.ToConverter;
import lombok.*;

/**
 * AccountDto
 *
 * @author Kimuihyeon
 * @since 2020.12.03
 */

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AccountDefaultDto implements ToConverter<Account, AccountDefaultDto> {

    private Long id;
    private String name; // 성명
    private String userId; // 계정
    private String nickName;


    /**
     * 생성자를 통해서만 변환할것.
     * 엔티티로 직접변환 하지말고 Id로 찾아서 사용할것.
     *
     * @return
     */
    @Deprecated
    @Override
    public Account toEntity() {
        return null;
    }

    /**
     * 생성자를 통해서만 변환할것.
     */
    @Deprecated
    @Override
    public AccountDefaultDto of(Account account) {
        return null;
    }

    public AccountDefaultDto(Account account) {
        this.id = account.getId();
        this.name = account.getName();
        this.userId = account.getUserId();
        this.nickName = account.getNickname();
    }

}
