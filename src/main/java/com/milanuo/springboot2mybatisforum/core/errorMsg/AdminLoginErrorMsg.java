package com.milanuo.springboot2mybatisforum.core.errorMsg;

import java.io.Serializable;

public class AdminLoginErrorMsg implements Serializable{
    private String username;
    private String password;
    private String msg;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
