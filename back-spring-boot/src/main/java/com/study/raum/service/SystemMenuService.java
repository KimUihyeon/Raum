package com.study.raum.service;

import com.study.raum.domain.system.SystemMenu;
import com.study.raum.domain.system.SystemMenuRepository;
import com.study.raum.dto.SystemMenuDto;
import com.study.raum.service.common.BaseCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author kuh
 * @since 2020.03.17
 */

@Service
public class SystemMenuService extends BaseCrudService<SystemMenu, SystemMenuDto> {

    private SystemMenuRepository systemMenuRepository;

    @Autowired
    public SystemMenuService(SystemMenuRepository systemMenuRepository){
        super(systemMenuRepository);
        this.systemMenuRepository = systemMenuRepository;
    }

    @Override
    public List<SystemMenuDto> findAll() {
        List<SystemMenu> tempList = this.systemMenuRepository.findAll();
        Map<Long, SystemMenuDto> menuItems = new HashMap<>();

        tempList.forEach(t -> {
            SystemMenuDto dto = SystemMenuDto.builder()
                    .etc(t.getEtc())
                    .id(t.getId())
                    .name(t.getDisplayName())
                    .url(t.getUrl()).build();

            if (t.getParentId() != null) { // 자식노드
                menuItems.get(t.getParentId()).getChildren().add(dto);
            } else { // 최상단 노드
                menuItems.put(t.getId(), dto);
            }
        });

        return new ArrayList(menuItems.values());
    }

    @Override
    public List<SystemMenuDto> findAllById(Iterable<Long> ids) {
        return this.entityFindAllById(ids);
    }

    @Override
    @Deprecated
    public SystemMenuDto save(SystemMenuDto dto) {
        throw new NotImplementedException();
    }

    @Override
    @Deprecated
    public SystemMenuDto update(long id, SystemMenuDto dto) {
        throw new NotImplementedException();
    }

    @Override
    @Deprecated
    public SystemMenuDto delete(long id) {
        throw new NotImplementedException();
    }

    @Override
    @Deprecated
    public Page<SystemMenuDto> findAll(int page, int size) {
        throw new NotImplementedException();
    }

    @Override
    @Deprecated
    public SystemMenuDto findById(long id) {
        throw new NotImplementedException();
    }
}
