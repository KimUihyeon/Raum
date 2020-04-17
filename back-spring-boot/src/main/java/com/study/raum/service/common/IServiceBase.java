package com.study.raum.service.common;

import org.springframework.data.domain.PageRequest;

import javax.transaction.Transactional;
import java.util.List;

/**
 * service 공통 인터페이스!
 * 미구현 메서드에는 Exception을 달아주자.
 *
 * @author kuh
 * @since 2020.04.08
 */
public interface IBasicService<T> {

    @Transactional
    T save(T dto);

    @Transactional
    T update(long id,T dto);

    @Transactional
    T delete(long id);

    List<T> findAll(int page, int size);

    List<T> findAll();

    T findById(long id);
}