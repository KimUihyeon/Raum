package com.study.raum.setting.util.paging;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * @author kuh
 * @since 2020.03.21
 */

@Data
@AllArgsConstructor
public class PagingRequestPram {

    private int skip = 0;   // 스킵할 데이터 갯수
    private int take = 20;  // 가져올 데이터

}
