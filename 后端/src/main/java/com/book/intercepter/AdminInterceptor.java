package com.book.intercepter;

import com.book.common.bean.Result;
import com.book.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class AdminInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.err.println("================================== preHandle1 ===========================================");
        boolean flag;
        String phone = (String) request.getSession().getAttribute("phone");

        if (phone == null) {
            System.out.println("null");
            //response.sendRedirect("#/login");
            flag = false;
        } else {
            flag = true;
        }
        return flag;
        //return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.err.println("================================== postHandle1 ===========================================");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.err.println("================================== afterCompletion1 ===========================================");
    }

}
