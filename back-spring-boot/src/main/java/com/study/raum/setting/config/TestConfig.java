package com.study.raum.setting.config;

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
        System.out.println("test Config load");
    }
}
