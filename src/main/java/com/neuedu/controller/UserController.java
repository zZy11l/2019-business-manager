package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(UserInfo userInfo,
                        HttpSession session,
                        HttpServletResponse response){

        UserInfo userInfo_result=userService.login(userInfo);
        if(userInfo==null){
            return "login";
        }

        session.setAttribute(Const.CURRENT_USER,userInfo_result);

        Cookie username_cookie=new Cookie("username",userInfo.getUsername());
        Cookie password_cookie=new Cookie("password",userInfo.getPassword());

        username_cookie.setMaxAge(60*60*24*7);
        password_cookie.setMaxAge(60*60*24*7);

        response.addCookie(username_cookie);
        response.addCookie(password_cookie);



        return "home";
    }

    @RequestMapping(value = "home",method = RequestMethod.GET)
    public String home(HttpSession session){


        return "home";
    }


    @RequestMapping(value = "home",method = RequestMethod.POST)
    public String categoryUpdate(){
        return "home";
    }


    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }


    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String register(UserInfo userInfo){

        userService.register(userInfo);

        return "redirect:/user/login";
    }

    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id,
                         HttpSession session){

        session.setAttribute(Const.USER_INFO,userService.findOne(id));


        return "user_update";
    }


    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(UserInfo userInfo){



        if(userService.update(userInfo)!=0){
            return "redirect:/user/find";
        }

        return "user_update";
    }

    @RequestMapping(value = "find",method = RequestMethod.GET)
    public String findAll(HttpSession session){

        List<UserInfo> categoryList= userService.findAll();

        session.setAttribute(Const.UESR_LIST,categoryList);

        return "user_list";

    }
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id){

        userService.delete(id);


        return "redirect:/user/find";


    }

}
