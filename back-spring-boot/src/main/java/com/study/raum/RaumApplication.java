package com.study.raum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;


@SpringBootApplication
public class RaumApplication {

    public static void main(String[] args) {
        SpringApplication.run(RaumApplication.class, args);
    }

}
