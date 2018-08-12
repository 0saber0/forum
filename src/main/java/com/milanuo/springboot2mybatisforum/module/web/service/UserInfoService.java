package com.milanuo.springboot2mybatisforum.module.web.service;

import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.web.dao.UserInfoMapper;
import com.milanuo.springboot2mybatisforum.module.web.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;


    public UserInfo findByUsername(String username) {
        return userInfoMapper.findByUsername(username);
    }

    public List<UserInfo> getAllUserInfo(Query4Topics query4Topics) {
        return userInfoMapper.getAllUserInfo(query4Topics);
    }

    public Integer getAllUserInfoCount(Query4Topics query4Topics) {
        return userInfoMapper.getAllUserInfoCount(query4Topics);
    }

    public void update(UserInfo userInfo) {
        userInfoMapper.updateByPrimaryKeySelective(userInfo);
    }

    public void delete(Integer id) {
        userInfoMapper.deleteByPrimaryKey(id);
    }

    public UserInfo getUserInfoById(Integer id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    public void save(UserInfo userInfo) {
        userInfoMapper.insertSelective(userInfo);
    }
}
