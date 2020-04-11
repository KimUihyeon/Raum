package com.study.raum.controller.common.system;


import com.study.raum.setting.PropertyFileManager;
import com.study.raum.setting.exceptions.ErrorResponseModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

/**
 * Controller Exception Handler
 *
 * @author 김의현
 * @since 20.03.03
 */
@ControllerAdvice
@PropertySource(PropertyFileManager.ERROR_MGS_PROP)
public class ExceptionController {

    @Value("${not_supported_http_method}")
    private String NOT_SUPPORTED_HTTP_METHOD;

    /**
     * 정의되지 않은 http method 요청시 발생하는 Exception 핸들
     * @param e HttpRequestMethodNotSupportedException
     * @return
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<ErrorResponseModel> requestMethodNotSupportedHandle(HttpRequestMethodNotSupportedException e){

        ErrorResponseModel error = new ErrorResponseModel(HttpStatus.INTERNAL_SERVER_ERROR.value()
                ,e.getMessage() + " ("+NOT_SUPPORTED_HTTP_METHOD+")");
        return new ResponseEntity<ErrorResponseModel>(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }


    /**
     * 미구현 인터페이스 요청시 발생하는 Exception
     * @param e NotImplementedException
     * @return
     */
    @ExceptionHandler(NotImplementedException.class)
    public ResponseEntity<ErrorResponseModel> notImplementedMethodExceptionHandle(NotImplementedException e){
        ErrorResponseModel error = new ErrorResponseModel(HttpStatus.BAD_REQUEST.value(), e.getMessage());
        return new ResponseEntity<ErrorResponseModel>(error, HttpStatus.BAD_REQUEST);
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
