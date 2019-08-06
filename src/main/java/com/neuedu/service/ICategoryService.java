package com.neuedu.service;

import com.neuedu.pojo.Category;

import java.util.List;

public interface ICategoryService {

    List<Category> findAll();

    int update(Category category);

    int delete(int id);

    int add(Category category);

    Category findOne(Integer id);
}
