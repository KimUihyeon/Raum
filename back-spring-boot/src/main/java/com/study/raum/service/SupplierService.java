package com.study.raum.service;

import com.study.raum.domain.members.Supplier;
import com.study.raum.service.common.ServiceBase;
import com.sun.xml.internal.ws.developer.Serialization;
import lombok.RequiredArgsConstructor;

import java.util.List;

/**
 * @author kuh
 * @since 2020.04.17
 */
@Serialization
@RequiredArgsConstructor
public class SupperialService extends ServiceBase<Supplier> {

    @Override
    public Supplier save(Supplier dto) {
        return null;
    }

    @Override
    public Supplier update(long id, Supplier dto) {
        return null;
    }

    @Override
    public Supplier delete(long id) {
        return null;
    }

    @Override
    public List<Supplier> findAll(int page, int size) {
        return null;
    }

    @Override
    public List<Supplier> findAll() {
        return null;
    }

    @Override
    public Supplier findById(long id) {
        return null;
    }

    private
}
