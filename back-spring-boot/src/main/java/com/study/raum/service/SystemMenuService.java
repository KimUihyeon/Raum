package com.study.raum.service;

import com.study.raum.domain.system.SystemMenu;
import com.study.raum.domain.system.SystemMenuRepository;
import com.study.raum.dto.SystemMenuDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



/**
 * @author kuh
 * @since 2020.03.17
 */

@Service("systemMenuService")
@RequiredArgsConstructor
public class SystemMenuService {

    private final SystemMenuRepository systemMenuRepository;



    public List<SystemMenuDto> getList() {
        List<SystemMenu> tempList = systemMenuRepository.findAll(Sort.by("parentId").ascending());
        Map<Long, SystemMenuDto> menuItems = new HashMap<>();

        tempList.forEach(t -> {
            SystemMenuDto dto = SystemMenuDto.builder()
                    .etc(t.getEtc())
                    .id(t.getId())
                    .name(t.getDisplayName())
                    .url(t.getUrl()).build();

            if (t.getParentId() != null) {
                menuItems.get(t.getParentId()).addChildren(dto);
            } else {
                menuItems.put(t.getId(), dto);
            }
        });

        return new ArrayList(menuItems.values());
    }
}