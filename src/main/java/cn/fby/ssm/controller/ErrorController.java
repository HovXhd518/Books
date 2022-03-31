package cn.fby.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

//    @RequestMapping("*")
//    public String notFoundPage(){
//        return "404";
//    }

    @RequestMapping("/testError")
    public void testError(){
        System.out.println(100/0);

    }
}
