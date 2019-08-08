package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.Product;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
import com.neuedu.util.OperateFile;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


import java.util.ArrayList;

import java.util.List;




@Controller
@RequestMapping("/user/product/")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ICategoryService categoryService;
    @RequestMapping(value = "all",method = RequestMethod.GET)
    public String all(HttpSession session){


        List<Product> products=productService.findAll();

        for(Product product:products){
            String s=product.getSubImages();
            product.setSubImages(s.substring(1,s.length()-1).replace(" ", ""));
        }

        session.setAttribute(Const.PRODUCT_LIST,products);
        session.setAttribute(Const.CATEGORY_LIST,categoryService.findAll());



        return "product_list";

    }

    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") int id,
                         HttpSession session){

        Product product=productService.findOne(id);
        session.setAttribute(Const.PRODUCT_INFO,product);
        return "product_update";

    }


    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(Product product,@PathVariable("id") int id,
                         @RequestParam("mainImage_file")MultipartFile mainImage,
                         @RequestParam("subImages_files") MultipartFile[] subImages){
        //删除之前的图片
        Product deleteProduct=  productService.findOne(id);
        OperateFile.deleteFile(deleteProduct.getMainImage());

        String s=deleteProduct.getSubImages();
        String m=s.substring(1,s.length()-1).replace(" ", "");
        String[] n= m.split(",");
        List<String> subImageslist=new ArrayList<>();
        for(int i=0;i<n.length;i++){
            subImageslist.add(n[i]);
        }
        OperateFile.deleteFiles(subImageslist);
        //插入更新的图片
        if(mainImage!=null&&subImages!=null&&subImages.length>0){

            product.setMainImage(OperateFile.upload(mainImage));

            StringBuffer stringBuffer=new StringBuffer();

            List<String> list= OperateFile.upload(subImages);

            product.setSubImages(list.toString());

        }

      int result= productService.update(product);
           if(result!=0){
               return "redirect:/user/product/all";
           }

           return "product_update";

    }
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "product_add";
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(Product product,
                      @RequestParam("mainImage_file")MultipartFile mainImage,
                      @RequestParam("subImages_files") MultipartFile[] subImages){



        if(mainImage!=null&&subImages!=null&&subImages.length>0){

            product.setMainImage(OperateFile.upload(mainImage));

            StringBuffer stringBuffer=new StringBuffer();

            List<String> list= OperateFile.upload(subImages);



            product.setSubImages(list.toString());

        }


        if(productService.add(product)!=0){
            return "redirect:/user/product/all";
        }

        return "product_add";
    }
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id){

        Product deleteProduct= productService.delete(id);
        OperateFile.deleteFile(deleteProduct.getMainImage());

        String s=deleteProduct.getSubImages();
        String m=s.substring(1,s.length()-1).replace(" ", "");
        String[] n= m.split(",");
        List<String> subImages=new ArrayList<>();
        for(int i=0;i<n.length;i++){
            subImages.add(n[i]);
        }


        OperateFile.deleteFiles(subImages);



        return "redirect:/user/product/all";
    }

}
