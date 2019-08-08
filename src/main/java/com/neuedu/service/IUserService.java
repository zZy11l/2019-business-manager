package com.neuedu.service;

import com.neuedu.pojo.UserInfo;

import java.util.List;


public interface IUserService {

    UserInfo login(UserInfo userInfo);

    int register(UserInfo userInfo);

    int update(UserInfo userInfo);

    int delete(int id);

    List<UserInfo> findAll();

    UserInfo findOne(int id);


}
