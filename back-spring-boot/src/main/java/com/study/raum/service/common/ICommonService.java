package com.study.raum.service.interfacies;

import com.study.raum.dto.PostsFaQDto;
import org.springframework.data.domain.Sort;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.04.08
 */
public interface ICommonService<T> {

    @Transactional
    T save(T data);

    @Transactional
    T update(T data);

    @Transactional
    T delete(T data);

    List<T> findAll();

    T findById(long id);
}
