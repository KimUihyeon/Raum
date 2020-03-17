package com.study.raum.controller;

import com.study.raum.domain.system.SystemMenu;
import com.study.raum.domain.system.SystemMenuRepository;
import com.study.raum.dto.SystemMenuDto;
import com.study.raum.service.SystemMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kuh
 * @since 2020.03.16
 */

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/system", produces = "application/json; charset=utf-8")
public class SystemApiController {

    private final SystemMenuService systemMenuService;

    @GetMapping("/menus")
    public List<SystemMenuDto> getMenus() {

        return this.systemMenuService.getList();
    };


}
