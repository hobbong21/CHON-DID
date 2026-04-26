package com.chon.api.config.exception;

import com.chon.api.config.exception.custom.IAException;
import com.chon.api.config.rest.ResponseData;
import com.chon.api.utils.StringBaseUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;


@RestControllerAdvice
public class ExceptionHandleController {

    @ExceptionHandler({IAException.class})
    public ResponseEntity<Object> handleException(IAException e) {
        int status = e.getStatus() == 0 ? 400 : e.getStatus();
        ResponseData responseData = new ResponseData();
        responseData.setErrorCode(e.getErrorCode());
        responseData.setErrorDesc(e.getErrorDesc());
        responseData.setStatus(status);
        return new ResponseEntity<>(responseData, HttpStatus.valueOf(status));
    }

    @ExceptionHandler({Exception.class})
    public ResponseEntity<Object> handleException(Exception e) {
        int status = 500;
        ResponseData responseData = new ResponseData();
        responseData.setErrorCode("500");
        responseData.setErrorDesc(e.getMessage());
        responseData.setStatus(status);
        return new ResponseEntity<>(responseData, HttpStatus.valueOf(status));
    }

    @ExceptionHandler({MethodArgumentNotValidException.class,})
    public ResponseEntity<Object> handleExceptionMethod(MethodArgumentNotValidException e) {
        //logger.info("Validate exception occurs: " + JsonUtil.toJson(e));

        List<ObjectError> allErrors = e.getBindingResult().getAllErrors();
        String defaultMessage = allErrors.getFirst().getDefaultMessage();
        int status = 400;
        ResponseData responseData = new ResponseData();
        responseData.setErrorCode("203");
        responseData.setErrorDesc(StringBaseUtils.isNullOrEmpty(defaultMessage) ? "203" : defaultMessage);
        responseData.setStatus(status);
        return new ResponseEntity<>(responseData, HttpStatus.valueOf(status));
    }
}
