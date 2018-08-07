package com.milanuo.springboot2mybatisforum.web.admin.log;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/log")
public class AdminLogController {

    @GetMapping("/list")
    public String list(Model model){

        return "admin/log/list";
    }

}
