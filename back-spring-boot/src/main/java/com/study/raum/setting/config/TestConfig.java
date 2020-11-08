package com.study.raum.setting.config;

import com.study.raum.setting.util.loggers.LoggerUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @author kuh
 * @since 2020.04.14
 */
@Configuration
@PropertySource("classpath:application-ErrorMsg.properties")
public class TestConfig {

    private Logger logger = LoggerFactory.getLogger(TestConfig.class);

    public TestConfig(){
        logger.debug("test Config load");
    }
}
