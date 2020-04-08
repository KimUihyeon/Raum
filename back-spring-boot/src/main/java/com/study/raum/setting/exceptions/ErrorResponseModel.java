package com.study.raum.setting.exceptions;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@RequiredArgsConstructor
public class ErrorResponseModel {

    private final int status;
    private final String message;
    private LocalDateTime date = LocalDateTime.now();

}
