package com.study.raum.setting.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Configuration
@EnableJpaAuditing
public class JpaConfigurator {

    public JpaConfigurator(){
        System.out.println("JpaConfiguration load");
    }
}
