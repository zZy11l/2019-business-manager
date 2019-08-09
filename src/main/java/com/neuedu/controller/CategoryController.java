package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user/category/")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;
    @RequestMapping(value = "index/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id,
                         HttpServletRequest request){

        if(id==0||id==null){

        }
        else
        request.setAttribute(Const.CATEGORY_INFO,categoryService.findOne(id));


        return "category/index";
    }


    @RequestMapping(value = "index/{id}",method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id,Category category){

        if(id==0||id==null){
            categoryService.add(category);
        }

    else{
            categoryService.update(category);
        }



          return "redirect:/user/category/find";



    }

    @RequestMapping(value = "find",method = RequestMethod.GET)
    public String findAll(HttpSession session){

      List<Category> categoryList= categoryService.findAll();

      session.setAttribute(Const.CATEGORY_LIST,categoryList);

      return "category/list";

    }
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id){

        categoryService.delete(id);


        return "redirect:/user/category/find";


    }



}
