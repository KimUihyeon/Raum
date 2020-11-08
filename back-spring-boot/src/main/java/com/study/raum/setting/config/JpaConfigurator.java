package com.study.raum.setting.config;

import com.study.raum.setting.util.loggers.LoggerUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * @author kuh
 * @since 2020.03.08
 */

@Configuration
@EnableJpaAuditing
public class JpaConfigurator {

    private Logger logger = LoggerFactory.getLogger(JpaConfigurator.class);

    public JpaConfigurator(){
        logger.debug("JpaConfiguration load");
    }
}
