package com.neuedu.service;

import com.neuedu.pojo.Product;

import java.util.List;

public interface IProductService {

    int add(Product product);

    int update(Product product);

    List<Product> findAll();

    Product findOne(int id);

    Product delete(int id);

}
