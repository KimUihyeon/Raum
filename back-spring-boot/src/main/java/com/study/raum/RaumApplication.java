package com.study.raum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.study")
public class RaumApplication {

    public static void main(String[] args) {
        SpringApplication.run(RaumApplication.class, args);
    }

}
