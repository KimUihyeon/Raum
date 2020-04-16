package com.study.raum.setting.master;

import com.study.raum.domain.members.Member;
import com.study.raum.setting.master.interfacies.IMasterFactory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * @author kuh
 * @since 2020.04.15
 */

public class MasterDataFactory<T> implements IMasterFactory<T> {
    @Override
    public boolean isExist(Long id) {
        return false;
    }

    @Override
    public void run(T data) throws Exception {

    }
//
//    private EntityManager entityManager;
//
//    @Override
//    public boolean isExist(Class<T> entityClass,Long id) {
//
//        try{
//            T data = entityManager.find(entityClass, id);
//            if (data != null) {
//                return true;
//            }
//            return false;
//
//        } catch (Exception e){
//            e.printStackTrace();
//            return true;
//        }
//
//    }
//
//    @Override
//    public void run(T data) throws Exception {
//        try{
//            this.entityManager
//            this.repository.save(data);
//        }catch (Exception e){
//            e.printStackTrace();;
//            throw e;
//        }
//    }
}
