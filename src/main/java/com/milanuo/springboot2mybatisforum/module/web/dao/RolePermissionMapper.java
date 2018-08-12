package com.milanuo.springboot2mybatisforum.module.web.dao;

import com.milanuo.springboot2mybatisforum.module.web.pojo.RolePermission;

import java.util.List;

public interface RolePermissionMapper {
    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    void deleteByRoleId(Integer id);

    List<Integer> getPerIdByRoleId(Integer id);

    void deleteByPermId(Integer id);
}