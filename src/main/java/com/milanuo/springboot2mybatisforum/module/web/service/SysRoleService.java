package com.milanuo.springboot2mybatisforum.module.web.service;

import com.milanuo.springboot2mybatisforum.module.web.dao.SysRoleMapper;
import com.milanuo.springboot2mybatisforum.module.web.pojo.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;


    public List<SysRole> getAllRole() {
        return sysRoleMapper.getAllRole();
    }

    public SysRole getSysRoleById(Integer id) {
        return sysRoleMapper.selectByPrimaryKey(id);
    }

    public void update(SysRole sysRole) {
        sysRoleMapper.updateByPrimaryKeySelective(sysRole);
    }

    public void delete(Integer id) {
        sysRoleMapper.deleteByPrimaryKey(id);
    }

    public void save(SysRole sysRole) {
        sysRoleMapper.insertSelective(sysRole);
    }
}
