package com.study.raum.domain.system;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SystemMenuRepository extends JpaRepository<SystemMenu, Long> {

}
