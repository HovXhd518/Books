package cn.fby.ssm.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object info = session.getAttribute("info");
        if ("admin".equals(info)){
            //超级管理员
            return true;
        }
        request.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }
}
