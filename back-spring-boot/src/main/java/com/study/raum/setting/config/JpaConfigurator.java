package com.study.raum.setting.config;

import com.study.raum.setting.util.loggers.LoggerUtil;
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
        LoggerUtil.sout("JpaConfiguration load");
    }
}
