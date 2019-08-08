package com.neuedu.service.impl;



import com.neuedu.dao.UserInfoMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public UserInfo login(UserInfo userInfo) {
        //step1: 参数非空判断
        if(userInfo==null){
            throw  new MyException("参数不能为空");
        }

        if(userInfo.getUsername()==null||userInfo.getUsername().equals("") ){//用户名为空

            throw  new MyException("用户名不能为空","login");

        }
        if(userInfo.getPassword()==null||userInfo.getPassword().equals("") ){//密码为空

            throw  new MyException("密码不能为空","login");

        }

        //setp2:判断用户名是否存在


        int result=userInfoMapper.existUsername(userInfo.getUsername());

        if(result==0){//用户名不存在

            throw new MyException("用户名不存在");
        }

        //step3:根据用户名和密码查询

        UserInfo userInfo_result=userInfoMapper.findUserByUsernameAndPassword( userInfo);
        if(userInfo_result==null){//密码错误
            throw new MyException("密码错误");
        }

        //step4:权限认证
        if(userInfo_result.getRole()!=0){
            throw new MyException("没有权限！");
        }


        return userInfo;
    }

    @Override
    public int register(UserInfo userInfo) {
        if(userInfoMapper.existUsername(userInfo.getUsername())==1){
            throw new MyException("用户名已经存在");
        }



        return userInfoMapper.insert(userInfo);
    }

    @Override
    public int update(UserInfo userInfo) {
        return userInfoMapper.updateByPrimaryKey(userInfo);
    }

    @Override
    public int delete(int id) {
        return userInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<UserInfo> findAll() {

        return userInfoMapper.selectAll();
    }

    @Override
    public UserInfo findOne(int id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

}
