package com.milanuo.springboot2mybatisforum.core.Shiro;

import com.milanuo.springboot2mybatisforum.module.web.pojo.SysPermission;
import com.milanuo.springboot2mybatisforum.module.web.pojo.SysRole;
import com.milanuo.springboot2mybatisforum.module.web.pojo.UserInfo;
import com.milanuo.springboot2mybatisforum.module.web.service.RolePermissionService;
import com.milanuo.springboot2mybatisforum.module.web.service.SysPermissionService;
import com.milanuo.springboot2mybatisforum.module.web.service.SysRoleService;
import com.milanuo.springboot2mybatisforum.module.web.service.UserRoleService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class ShiroTag {


  @Autowired
  private SysRoleService sysRoleService;

  @Autowired
  private UserRoleService userRoleService;

  @Autowired
  private RolePermissionService rolePermissionService;

  @Autowired
  private SysPermissionService sysPermissionService;

  /**
   * Gets the admin_user name of the admin_user from the Authentication object
   *
   * @return the admin_user name as string
   */
  public String getPrincipal() {
    Object obj = SecurityUtils.getSubject().getPrincipal();

    if (obj instanceof UserInfo) {
      return ((UserInfo) obj).getUsername();
    } else {
      return null;
    }
  }

  /**
   * Is the admin_user granted all of the grantedAuthorities passed in
   *
   * @param checkForAuths a string array of grantedAuth
   * @return true if admin_user has all of the listed authorities/roles, otherwise
   * false
   */
  public boolean allGranted(String[] checkForAuths) {
    Set<String> userAuths = getUserAuthorities();
    for (String auth : checkForAuths) {
      if (userAuths.contains(auth))
        continue;
      return false;
    }
    return true;
  }

  public boolean allGranted(String checkForAuths) {
    Set<String> userAuths = getUserAuthorities();
    if (userAuths.contains(checkForAuths))
      return true;
    return false;
  }

  /**
   * Is the admin_user granted any of the grantedAuthorities passed into
   *
   * @param checkForAuths a string array of grantedAuth
   * @return true if admin_user has any of the listed authorities/roles, otherwise
   * false
   */
  public boolean anyGranted(String[] checkForAuths) {
    Set<String> userAuths = getUserAuthorities();
    for (String auth : checkForAuths) {
      if (userAuths.contains(auth))
        return true;
    }
    return false;
  }

  /**
   * is the admin_user granted none of the supplied roles
   *
   * @param checkForAuths a string array of roles
   * @return true only if none of listed roles are granted
   */
  public boolean noneGranted(String[] checkForAuths) {
    Set<String> userAuths = getUserAuthorities();
    for (String auth : checkForAuths) {
      if (userAuths.contains(auth))
        return false;
    }
    return true;
  }

  @SuppressWarnings("unchecked")
  private Set<String> getUserAuthorities() {
    try {
      Object obj = SecurityUtils.getSubject().getPrincipal();
      Set<String> perms = new HashSet<>();
      if (obj instanceof UserInfo) {
        //获取user的Role的set集合
        List<Integer> roleIds = userRoleService.getRolesIdByUserId(((UserInfo)obj).getId());
          for(Integer roleId:roleIds){
              SysRole sysRole = sysRoleService.getSysRoleById(roleId);

              //获取角色的权限
              List<Integer> permIds = rolePermissionService.getPerIdByRoleId(roleId);
              for(Integer permId:permIds){
                  SysPermission sysPermission = sysPermissionService.getPerById(permId);
                  perms.add(sysPermission.getName());
              }
          }
      }
      return perms;
    } catch (Exception e) {
      return new HashSet<>();
    }
  }

}
