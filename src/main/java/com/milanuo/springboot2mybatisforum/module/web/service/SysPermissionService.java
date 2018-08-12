package com.milanuo.springboot2mybatisforum.module.web.service;

import com.milanuo.springboot2mybatisforum.module.web.dao.SysPermissionMapper;
import com.milanuo.springboot2mybatisforum.module.web.pojo.SysPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysPermissionService {

    @Autowired
    private SysPermissionMapper sysPermissionMapper;

    public List<SysPermission> getAll() {
        return sysPermissionMapper.getAll();
    }

    public List<SysPermission> getAllIdName() {
        return sysPermissionMapper.getAllIdName();
    }

    public SysPermission getPerById(Integer id) {
        return sysPermissionMapper.selectByPrimaryKey(id);
    }

    public void update(SysPermission sysPermission) {
        sysPermissionMapper.updateByPrimaryKeySelective(sysPermission);
    }

    public void save(SysPermission sysPermission) {
        sysPermissionMapper.insertSelective(sysPermission);
    }

    public void delete(Integer id) {
        sysPermissionMapper.deleteByPrimaryKey(id);
    }
}
