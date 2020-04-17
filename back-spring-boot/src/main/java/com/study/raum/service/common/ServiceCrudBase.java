package com.study.raum.service.common;

import com.study.raum.dto.common.IEntityConverter;
import com.study.raum.setting.PropertyFileManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author kuh
 * @since 2020.04.16
 */


@PropertySource(PropertyFileManager.ERROR_MGS_PROP)
public abstract class ServiceBase<Entity> extends ServiceErrorBundle implements IServiceBase<Entity> {

    protected JpaRepository<Entity, Long> jpaRepository;


    public ServiceBase(JpaRepository jpaRepository) {
        this.jpaRepository = jpaRepository;
    }


    protected Entity entitySave(Entity entity) {
        return this.jpaRepository.save(entity);
    }


    @Transactional
    protected Entity entityDelete(long id) throws DataAccessException {
        Entity entity = null;

        try {
            entity = this.jpaRepository.findById(id).orElseThrow(() -> {
                throw new IllegalArgumentException(NOT_FIND_DATA);
            });

            this.jpaRepository.deleteById(id);
            return entity;
        } catch (Exception e) {
            e.printStackTrace();
            throw new IllegalArgumentException(FAIL_DELETE_JPA);
        }
    }

    protected List<Entity> entityFindAll(int page, int size) {
        Page<Entity> entities = this.jpaRepository.findAll(PageRequest.of(page, size));
        return entities.toList();
    }

    protected List<Entity> entityFindAll() {
        return this.jpaRepository.findAll();
    }

    ;

    protected Entity entityFindById(long id) {
        return this.jpaRepository.findById(id).orElseThrow(() -> {
            throw new IllegalArgumentException(NOT_FIND_DATA);
        });
    }

    @Deprecated
    protected Entity entityUpdate(long id, IEntityConverter<Entity> dto) {
        throw new NotImplementedException();
    }

}
