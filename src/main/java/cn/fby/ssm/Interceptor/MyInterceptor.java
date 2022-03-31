package cn.fby.ssm.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //类似于filter 中的doFilter（） 放行的意思 返回值是一个true 则请求就可以继续向下执行
        //在controller中的方法执行前执行
        System.out.println("1 preHandle方法执行了、、、、、、");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //postHandle()方法：该方法会在控制器方法调用之后，且解析视图之前执行。可以通过此方法对请求域中的模型和视图做出进一步的修改
        System.out.println("2 postHandle方法执行了");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //afterCompletion()方法：该方法会在整个请求完成，即视图渲染结束之后执行。可以通过此方法实
        //现一些资源清理、记录日志信息等工作
        System.out.println("3 afterCompletion方法执行了 ");
    }
}
