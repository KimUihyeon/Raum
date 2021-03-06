//package com.study.raum.controller;
//
//import com.study.raum.dto.SystemComponentDTO;
//import com.study.raum.dto.SystemMenuDto;
//import com.study.raum.service.SystemComponentService;
//import com.study.raum.service.SystemMenuService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
///**
// * @author kuh
// * @since 2020.03.16
// */
//
//@RestController
//@RequiredArgsConstructor
//@RequestMapping(value = "/api/v1/system", produces = "application/json; charset=utf-8")
//public class SystemApiController {
//
//    private final SystemMenuService systemMenuService;
//    private final SystemComponentService systemComponentService;
//
//    @GetMapping("/menus")
//    public List<SystemMenuDto> getMenus() {
//
//        return this.systemMenuService.findAll();
//    }
//
//
//    @GetMapping("/components")
//    public List<SystemComponentDTO> getComponents() {
//
//        return systemComponentService.getList();
//    }
//
//}
