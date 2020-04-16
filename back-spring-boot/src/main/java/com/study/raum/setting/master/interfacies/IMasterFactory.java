package com.study.raum.setting.master.interfacies;

import org.springframework.stereotype.Component;

/**
 * @author kuh
 * @since 2020.04.15
 */

@Component
public interface IMasterFactory<T> {

    boolean isExist(Long id);
    void run(T data) throws Exception;

}
