package com.study.raum.setting;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Configuration
@EnableJpaAuditing
public class JpaConfiguration {

    public JpaConfiguration(){
        System.out.println("JpaConfiguration load");
    }
}
