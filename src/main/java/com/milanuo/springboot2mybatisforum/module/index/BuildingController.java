package com.milanuo.springboot2mybatisforum.module.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuildingController {

    @RequestMapping("/building")
    public String index(){
        return "front/building";
    }
}
