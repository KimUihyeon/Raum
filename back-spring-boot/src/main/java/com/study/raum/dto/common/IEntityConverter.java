package com.study.raum.dto.common;

/**
 *
 * @param <T> entity class
 */
public interface IEntityConverter<T> {

    T toEntity();
}
