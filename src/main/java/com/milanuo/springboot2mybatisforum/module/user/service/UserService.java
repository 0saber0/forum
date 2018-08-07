package com.milanuo.springboot2mybatisforum.module.user.service;

import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.user.dao.UserMapper;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public void add(User user) {
        userMapper.insert(user);
    }

    public User getOne(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public User doLogin(User user) {
        return userMapper.doLogin(user);
    }

    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    public User getUserByUserName(String username) {
        return userMapper.getUserByUserName(username);
    }

    public List<User> getAllUser(Query4Topics query4Topics) {
        return userMapper.getAllUser(query4Topics);
    }

    public Integer getAllUserCount(Query4Topics query4Topics) {
        return userMapper.getAllUserCount(query4Topics);
    }

    public void delete(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }
}
