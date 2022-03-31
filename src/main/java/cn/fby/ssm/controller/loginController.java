package cn.fby.ssm.controller;

import cn.fby.ssm.bean.Msg;
import cn.fby.ssm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class loginController {

    @RequestMapping("/login")
    public void login(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getUName()!=null || user.getUName()!=""){
            HttpSession session = request.getSession();
            session.setAttribute("info",user.getUName());
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }

}
