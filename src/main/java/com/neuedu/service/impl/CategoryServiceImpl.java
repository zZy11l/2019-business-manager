package com.neuedu.service.impl;

import com.neuedu.dao.CategoryMapper;
import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> findAll() {
        List<Category> categoryList=  categoryMapper.selectAll();


        return categoryList;
    }

    @Override
    public int update(Category category) {

        return categoryMapper.updateByPrimaryKey(category);
    }

    @Override
    public int delete(int id) {

        int result=categoryMapper.deleteByPrimaryKey(id);

        return result;
    }

    @Override
    public int add(Category category) {
        int result=categoryMapper.insert(category);
        return result;
    }

    @Override
    public Category findOne(Integer id) {

        Category category=categoryMapper.selectByPrimaryKey(id);
        System.out.println(category);
        return category;
    }
}
