package com.milanuo.springboot2mybatisforum.core.ExceptionHandler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 密拉诺.
 * Copyright (c) 2018, All Rights Reserved.
 */
@ControllerAdvice
public class GlobalExceptionHandler {


  private HttpStatus getStatus(HttpServletRequest request) {
    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    if (statusCode == null) {
      return HttpStatus.INTERNAL_SERVER_ERROR;
    }
    return HttpStatus.valueOf(statusCode);
  }

  /**
   * 错误页面统一处理
   *
   * @param request
   * @param e
   * @return
   * @throws Exception
   */
  @ExceptionHandler(value = Exception.class)
  public ModelAndView defaultErrorHandler(HttpServletRequest request, Exception e) throws Exception {
    e.printStackTrace();
    ModelAndView mav = new ModelAndView();
    mav.addObject("exception", e);
    mav.addObject("errorCode", getStatus(request));
    mav.setViewName("front/error");
    return mav;
  }

}