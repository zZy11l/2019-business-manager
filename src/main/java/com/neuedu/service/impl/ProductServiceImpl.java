package com.neuedu.service.impl;

import com.neuedu.dao.ProductMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Product;
import com.neuedu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public int add(Product product) {
        if(product==null){
            throw new MyException("参数为空");
        }
        if(product.getCategoryId()==null||product.getDetail()==null||product.getMainImage()==null
        ||product.getName()==null||product.getPrice()==null||
                product.getStatus()==null||product.getStock()==null||product.getSubImages()==null
                ||product.getSubtitle()==null){
            throw new MyException("请填写商品信息");
        }



        return productMapper.insert(product);
    }

    @Override
    public int update(Product product) {

        return productMapper.updateByPrimaryKey(product);
    }

    @Override
    public List<Product> findAll() {

        return productMapper.selectAll();
    }

    @Override
    public Product findOne(int id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public Product delete(int id) {
        Product deleteProduct=  productMapper.selectByPrimaryKey(id);

        productMapper.deleteByPrimaryKey(id);
        return deleteProduct;
    }
}
