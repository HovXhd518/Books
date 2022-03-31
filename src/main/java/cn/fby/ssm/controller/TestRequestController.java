package cn.fby.ssm.controller;

import cn.fby.ssm.bean.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TestRequestController {

//    @RequestMapping(value="/testGet",method = RequestMethod.GET)
    @GetMapping("/test")
    public String testGet(Model model){
        model.addAttribute("msg","这是一个get请求");
        return "test";
    }


    @PostMapping("/test")
    public String testPost(Model model){
        model.addAttribute("msg","这是一个post请求");
        return "test";
    }

/*
    @ResponseBody
    @PutMapping("/test")
    public Msg testPut(Model model){
        model.addAttribute("msg","这是一个put请求");
        return Msg.success().add("msg","这是一个put请求");
    }
*/
    @ResponseBody
    @PutMapping("/test")
    public String testPut(Model model){
        model.addAttribute("msg","这是一个put请求");
        return "test";
    }

    @ResponseBody
    @DeleteMapping("/test")
    public Msg testDel(Model model){
        return Msg.success().add("msg","这是一个delete请求");
    }
}
