package com.milanuo.springboot2mybatisforum.module.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

    @RequestMapping("/register")
    public String index(){
        return "front/register";
    }
}
