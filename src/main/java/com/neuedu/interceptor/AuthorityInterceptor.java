package com.neuedu.interceptor;

import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthorityInterceptor implements HandlerInterceptor {
    @Autowired
    private IUserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

       Cookie[] cookies= request.getCookies();
       String username=null;
       String password=null;
       if(cookies!=null&&cookies.length>0){
            for(Cookie cookie:cookies){
                if(cookie.getName().equals("username")){
                   username= cookie.getValue();
                }
                if(cookie.getName().equals("password")){
                    password=cookie.getValue();
                }

            }
       }
        UserInfo userInfo=new UserInfo();
       if(username!=null&&password!=null){
           userInfo.setUsername(username);
           userInfo.setPassword(password);
            UserInfo userInfo_result=  userService.login(userInfo);
         if(userInfo_result!=null){
             return true;
         }

       }


        response.sendRedirect("/user/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
