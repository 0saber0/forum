package com.milanuo.springboot2mybatisforum.core.Shiro.handlers;

import com.milanuo.springboot2mybatisforum.core.errorMsg.AdminLoginErrorMsg;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/shiro")
public class ShiroHandler {


    @RequestMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("code") String code, HttpServletRequest request, Model model) {

        String indexCode = (String) request.getSession().getAttribute("index_code");
        AdminLoginErrorMsg adminLoginErrorMsg = new AdminLoginErrorMsg();
        adminLoginErrorMsg.setUsername(username);
        adminLoginErrorMsg.setPassword(password);
        model.addAttribute("adminLoginErrorMsg",adminLoginErrorMsg);

        if (indexCode.equalsIgnoreCase(code)) {

            Subject currentUser = SecurityUtils.getSubject();

            if (!currentUser.isAuthenticated()) {
                //把用户名和密码封装为UsernamePasswordToken
                UsernamePasswordToken upToken = new UsernamePasswordToken(username, password);
                //rememberMe
                upToken.setRememberMe(true);
                try {
                    //执行登录
                    currentUser.login(upToken);
                } catch (UnknownAccountException uae) {
                    //若没有指定用户，则shiro将抛出UnknownAccountException异常
                    adminLoginErrorMsg.setMsg("没有该用户！");
                    return "/admin/login";
                } catch (IncorrectCredentialsException ice) {
                    //若账户存在，而密码不匹配，则shiro将抛出IncorrectCredentialsException异常
                    adminLoginErrorMsg.setMsg("密码错误！");
                    return "/admin/login";
                } catch (LockedAccountException lae) {
                    //账户被锁定异常LockedAccountException
                    adminLoginErrorMsg.setMsg("账户被锁定！");
                    return "/admin/login";
                } catch (AuthenticationException ae) {
                    //所有认证异常的父类
                    adminLoginErrorMsg.setMsg(ae.getMessage());
                    return "/admin/login";
                }

            }
            return "admin/index";
        }else {
            adminLoginErrorMsg.setMsg("验证码不正确！");
            return "/admin/login";
        }
    }
}
