package cn.fby.ssm.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


/*
* @ControllerAdvice 标注是一个异常处理的类
* */
@ControllerAdvice
public class ExceptionController {

    /*
    *Exception ex 捕获的异常信息
    *@ExceptionHandler 是一个异常的Class对象
    * @return 异常处理的视图
    * */
    @ExceptionHandler(value = {Exception.class})
    public String exceptionResolver(Model model,Exception ex){
        //把异常信息返回给视图
        model.addAttribute("ex",ex);
        //视图
        return "error";
    }
}
