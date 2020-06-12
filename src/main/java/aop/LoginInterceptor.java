package aop;

import entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    // 控制层方法执行之前
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        System.out.println("拦截到请求");
        if(admin==null){
            response.sendRedirect("/login.jsp");
            return false;
        }
        return true;
    }


    // 控制层方法执行放回之后执行
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("进入拦截器postHandler方法");
        if(modelAndView!=null) {
            System.out.println("获取到控制层返回结果：" + modelAndView.getModelMap());
            System.out.println("view:" + modelAndView.getViewName());
        }
    }

    // 视图解析之后执行
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("进入拦截器afterCompletion");
    }
}
