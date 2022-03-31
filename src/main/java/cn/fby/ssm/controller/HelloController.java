package cn.fby.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/hello")
    public String hello(Model model){
        model.addAttribute("msg","hello springmvc Interceptor");
        return "hello";
    }

    @RequestMapping("/hello1")
    public String hello1(Model model){
        System.out.println("4hello1 controller 被执行了。。。。");
        model.addAttribute("msg","hello springmvc Interceptor");
        return "hello";
    }
}
