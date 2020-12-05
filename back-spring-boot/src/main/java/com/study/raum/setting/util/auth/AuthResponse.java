package com.study.raum.setting.util.auth;

import com.study.raum.setting.ApplicationStringConfig;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author kuh
 * @since 2020.05.10
 */
@Data
@Builder
@AllArgsConstructor
public class AuthResponse {

    private AuthEnum authType;

    private String id;

    private String name;

    private String token;

    private String authDate;

    private String authEndDate;

    private String IIS;

    public AuthResponse(){
        this.authDate = new SimpleDateFormat(ApplicationStringConfig.DATE_FORMAT).format(new Date());
    }

}
