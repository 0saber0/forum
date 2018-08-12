package com.milanuo.springboot2mybatisforum.module.web.pojo;

import java.io.Serializable;

public class RolePermission implements Serializable {
    private Integer roleId;

    private Integer perId;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPerId() {
        return perId;
    }

    public void setPerId(Integer perId) {
        this.perId = perId;
    }
}