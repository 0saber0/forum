package com.milanuo.springboot2mybatisforum.module.index;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutController {

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){

        request.getSession().invalidate();
        return "redirect:index";
    }
}
