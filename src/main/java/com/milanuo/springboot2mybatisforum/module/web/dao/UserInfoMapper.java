package com.milanuo.springboot2mybatisforum.module.web.dao;

import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.web.pojo.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    UserInfo findByUsername(String username);

    List<UserInfo> getAllUserInfo(Query4Topics query4Topics);

    Integer getAllUserInfoCount(Query4Topics query4Topics);
}