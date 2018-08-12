package com.milanuo.springboot2mybatisforum.module.web.dao;

import com.milanuo.springboot2mybatisforum.module.web.pojo.SysPermission;

import java.util.List;

public interface SysPermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    SysPermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);

    List<SysPermission> getAll();

    List<SysPermission> getAllIdName();
}