package com.milanuo.springboot2mybatisforum.module.user.dao;

import com.milanuo.springboot2mybatisforum.module.user.pojo.User;


public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User doLogin(User user);

    User getUserByUserName(String username);
}