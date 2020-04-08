package com.study.raum.service;

import com.study.raum.domain.system.SystemComponentRepository;
import com.study.raum.dto.SystemComponentDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author kuh
 * @since 2020.03.21
 */

@Service
@RequiredArgsConstructor
public class SystemComponentService {

    private final SystemComponentRepository systemComponentRepository;

    public List<SystemComponentDTO> getList() {
        return this.systemComponentRepository.findAll().stream().map(t ->
                new SystemComponentDTO(t)).collect(Collectors.toList());
    }
}
