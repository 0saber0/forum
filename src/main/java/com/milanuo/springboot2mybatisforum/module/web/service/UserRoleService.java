package com.milanuo.springboot2mybatisforum.module.web.service;

import com.milanuo.springboot2mybatisforum.module.web.dao.UserRoleMapper;
import com.milanuo.springboot2mybatisforum.module.web.pojo.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;


    public List<Integer> getRolesIdByUserId(Integer id) {
        return userRoleMapper.getRolesIdByUserId(id);
    }

    public void deleteByUserInfoId(Integer id) {
        userRoleMapper.deleteByUserInfoId(id);
    }

    public void save(UserRole userRole) {
        userRoleMapper.insert(userRole);
    }
}
