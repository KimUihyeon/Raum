package com.study.raum.setting;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Controller Exception Handler
 *
 * @author 김의현
 * @since 20.03.03
 */
@ControllerAdvice
public class ExceptionController {


    /**
     * 정의되지 않은 http method 요청시 발생하는 Exception 핸들
     * @param e HttpRequestMethodNotSupportedException
     * @return
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<ErrorResponseModel> requestMethodNotSupprotedHandle(HttpRequestMethodNotSupportedException e){

        ErrorResponseModel error = new ErrorResponseModel(HttpStatus.INTERNAL_SERVER_ERROR.value()
                ,e.getMessage() + " (지원하지 않는 http method 입니다.)");
        return new ResponseEntity<ErrorResponseModel>(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }


    /**
     * NullPointerException , OutOfMemoryException 등
     * 정의되지 않은 Exception을 처리하기 위한 핸들
     * @param e Exception
     * @return
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponseModel> commonExceptionHandle(Exception e){

        ErrorResponseModel error = new ErrorResponseModel(HttpStatus.INTERNAL_SERVER_ERROR.value(),e.getMessage());
        return new ResponseEntity<ErrorResponseModel>(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
