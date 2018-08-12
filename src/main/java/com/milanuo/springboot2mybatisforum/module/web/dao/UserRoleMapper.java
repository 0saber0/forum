package com.milanuo.springboot2mybatisforum.module.web.dao;

import com.milanuo.springboot2mybatisforum.module.web.pojo.UserRole;

import java.util.List;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);

    List<Integer> getRolesIdByUserId(Integer id);

    void deleteByUserInfoId(Integer id);
}