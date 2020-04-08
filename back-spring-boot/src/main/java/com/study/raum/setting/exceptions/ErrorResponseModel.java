package com.study.raum.setting;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.Date;

@Data
@RequiredArgsConstructor
public class ErrorResponseModel {

    private final int status;
    private final String message;
    private Date date = new Date();

}
