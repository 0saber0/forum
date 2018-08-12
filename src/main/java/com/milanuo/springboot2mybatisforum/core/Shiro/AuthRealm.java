package com.milanuo.springboot2mybatisforum.core.Shiro;

import com.milanuo.springboot2mybatisforum.module.web.pojo.SysPermission;
import com.milanuo.springboot2mybatisforum.module.web.pojo.SysRole;
import com.milanuo.springboot2mybatisforum.module.web.pojo.UserInfo;
import com.milanuo.springboot2mybatisforum.module.web.service.*;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

@Component
public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private RolePermissionService rolePermissionService;

    @Autowired
    private SysPermissionService sysPermissionService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        //获取登录用户的信息
        UserInfo userInfo = (UserInfo) principals.getPrimaryPrincipal();

        //查询当前登录用户的角色和权限
        UserInfo user = userInfoService.findByUsername(userInfo.getUsername());
        if(user!=null){
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            //因为addRoles和addStringPermissions方法需要的参数类型是Collection
            //所以先创建两个collection集合
            Collection<String> rolesCollection = new HashSet<>();
            Collection<String> perStringCollection = new HashSet<>();

            //获取user的Role的set集合
            List<Integer> roleIds = userRoleService.getRolesIdByUserId(user.getId());
            for(Integer roleId:roleIds){
                SysRole sysRole = sysRoleService.getSysRoleById(roleId);
                rolesCollection.add(sysRole.getRole());

                //获取角色的权限
                List<Integer> permIds = rolePermissionService.getPerIdByRoleId(roleId);
                for(Integer permId:permIds){
                    SysPermission sysPermission = sysPermissionService.getPerById(permId);
                    perStringCollection.add(sysPermission.getName());
                }

                //为用户授权
                info.addStringPermissions(perStringCollection);
            }
            //为用户授予角色
            info.addRoles(rolesCollection);
            return info;
        }else{
            return null;
        }
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
            throws AuthenticationException {

        //把AuthenticationToken转换为UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;

        //从UsernamePasswordToken中取出username
        String username = upToken.getUsername();

        //通过username从数据库中查找 User对象，如果找到，没找到.
        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        UserInfo userInfo = userInfoService.findByUsername(username);
        if (userInfo == null) {
            throw new UnknownAccountException("用户不存在！");
        } else {
            if (userInfo.getState() == 2) {
                throw new LockedAccountException("用户被锁定！");
            }
        }
        //当前realm对象的name
        String realmName = getName();
        //盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(userInfo.getUsername());
        //封装用户信息，构建AuthenticationInfo对象并返回
        AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(),
                credentialsSalt, realmName);

        return authcInfo;
    }
}
