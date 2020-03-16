package com.study.raum.controller;

import com.study.raum.domain.system.SystemComponent;
import com.study.raum.domain.system.SystemComponentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@CrossOrigin(origins={"http://localhost:3000", "http://localhost:8080"})
@RequestMapping(value = "/api/v1/system", produces = "application/json; charset=utf-8")
public class SystemApiController {

    private final SystemComponentRepository systemComponentRepository;

    @GetMapping("/menus")
    public List<SystemComponent> getMenus() {
        return this.systemComponentRepository.findAll(Sort.by("id").ascending());
    };
}
