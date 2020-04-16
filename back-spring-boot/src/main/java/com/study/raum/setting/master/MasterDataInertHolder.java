package com.study.raum.setting.master;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author kuh
 * @since 2020.04.15
 */

@Data
@Builder
public class MasterDataInertHolder<T> {

    private JpaRepository<T,Long> jpaRepository;

    private List<T> datas;
}
