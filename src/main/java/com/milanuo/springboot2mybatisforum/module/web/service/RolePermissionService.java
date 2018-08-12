package com.milanuo.springboot2mybatisforum.module.web.service;

import com.milanuo.springboot2mybatisforum.module.web.dao.RolePermissionMapper;
import com.milanuo.springboot2mybatisforum.module.web.pojo.RolePermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RolePermissionService {

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    public void deleteByRoleId(Integer id) {
        rolePermissionMapper.deleteByRoleId(id);
    }

    public List<Integer> getPerIdByRoleId(Integer id) {
        return rolePermissionMapper.getPerIdByRoleId(id);
    }

    public void save(RolePermission rolePermission) {
        rolePermissionMapper.insertSelective(rolePermission);
    }

    public void deleteByPermId(Integer id) {
        rolePermissionMapper.deleteByPermId(id);
    }
}
