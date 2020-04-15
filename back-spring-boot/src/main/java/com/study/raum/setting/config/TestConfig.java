package com.study.raum.setting.config;

import com.study.raum.setting.util.loggers.LoggerUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @author kuh
 * @since 2020.04.14
 */
@Configuration
@PropertySource("classpath:application-ErrorMsg.properties")
public class TestConfig {

    public TestConfig(){
        LoggerUtil.sout("test Config load");
    }
}
