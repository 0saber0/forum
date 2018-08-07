package com.milanuo.springboot2mybatisforum.module.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(HttpSession session){
        session.invalidate();
        return "front/login";
    }
}
