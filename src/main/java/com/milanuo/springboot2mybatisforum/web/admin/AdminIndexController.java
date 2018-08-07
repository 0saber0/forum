package com.milanuo.springboot2mybatisforum.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @GetMapping("/login")
    public String login(){
        return "admin/login";
    }

    @PostMapping("/adminLogin")
    public String adminLogin(String username, String password, String code, Model model){

        return "admin/index";
    }

    @GetMapping("/index")
    public String index(){
        return "admin/index";
    }
}
