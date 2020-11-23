package com.study.raum.setting.config;

import com.study.raum.setting.filter.AuthFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author kuh
 * @since 2020.03.16
 */

@Configuration
public class WebConfigurator implements WebMvcConfigurer {
//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//
//        String[] origins = {
//                "*",
////                "http://localhost:3000/",
////                "http://localhost:8080/"
//        };
//
//        registry.addMapping("/**") //모든 요청에 대해서
//                .allowedOrigins(origins)
//                .allowedHeaders(HttpMethod.GET.name(),
//                        HttpMethod.POST.name(),
//                        HttpMethod.PATCH.name(),
//                        HttpMethod.DELETE.name())
//                .allowedHeaders(HttpHeaders.AUTHORIZATION,
//                        "AUTHORIZATION",
//                        "authorization",
//                        HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN,
//                        HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS)
//                .allowCredentials(false)
//                .exposedHeaders("AUTHORIZATION")
//                .maxAge(3600); //허용할 오리진들
//    }

    @Bean
    public WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                String[] origins = {
                "http://localhost:3000",
                "http://localhost:8080"
                };

                registry.addMapping("/**") //모든 요청에 대해서
                        .allowedOrigins(origins)
                        .allowedHeaders(HttpMethod.GET.name(),
                                HttpMethod.POST.name(),
                                HttpMethod.PATCH.name(),
                                HttpMethod.OPTIONS.name(),
                                HttpMethod.DELETE.name())
                        .allowedHeaders(HttpHeaders.AUTHORIZATION,
                                "AUTHORIZATION",
                                "authorization",
                                "withcredentials",
                                HttpHeaders.ORIGIN,
                                HttpHeaders.CONTENT_TYPE,
                                HttpHeaders.USER_AGENT,
                                HttpHeaders.HOST,
                                HttpHeaders.ACCEPT_LANGUAGE,
                                HttpHeaders.ACCEPT_ENCODING,
                                HttpHeaders.ACCEPT,
                                HttpHeaders.CONNECTION,
                                HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN,
                                HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS,
                                HttpHeaders.WWW_AUTHENTICATE)
                        .allowCredentials(true)
                        .exposedHeaders("authorization","withcredentials")
                        .maxAge(3600); //허용할 오리진들
            }
        };
    }


    @Bean
    public FilterRegistrationBean authFilter(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new AuthFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.setName("Auth Filter");
        filterRegistrationBean.setOrder(1);
        return filterRegistrationBean;
    }

}
