package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
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
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IProductService productService;

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(UserInfo userInfo,
                        HttpSession session,
                        HttpServletResponse response){

        List<Category> categoryList= categoryService.findAll();
        List<Product> productList=productService.findAll();

        UserInfo userInfo_result=userService.login(userInfo);

        if(userInfo==null){
            return "login";
        }

        session.setAttribute(Const.CURRENT_USER,userInfo_result);
        session.setAttribute(Const.CATEGORY_LIST,categoryList);
        session.setAttribute(Const.PRODUCT_LIST,productList);

        Cookie username_cookie=new Cookie("username",userInfo.getUsername());
        Cookie password_cookie=new Cookie("password",userInfo.getPassword());

        username_cookie.setMaxAge(60*60*24*7);
        password_cookie.setMaxAge(60*60*24*7);

        response.addCookie(username_cookie);
        response.addCookie(password_cookie);



        return "redirect:/user/home";
    }

    @RequestMapping(value = "home",method = RequestMethod.GET)
    public String home(){


        return "home/home";
    }




    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id,
                         HttpServletRequest request){

        if(id==0||id==null){

        }
        else{
            request.setAttribute(Const.USER_INFO,userService.findOne(id));
        }


        return "user/user_update";
    }


    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id,UserInfo userInfo){


        if(id==0||id==null){
            userService.register(userInfo);

        }
        else{
            userService.update(userInfo);

        }



        return "redirect:/user/find";
    }

    @RequestMapping(value = "find",method = RequestMethod.GET)
    public String findAll(HttpSession session){

        List<UserInfo> categoryList= userService.findAll();

        session.setAttribute(Const.UESR_LIST,categoryList);

        return "user/user_list";

    }
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id){

        userService.delete(id);


        return "redirect:/user/find";


    }

}
