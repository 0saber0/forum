package com.milanuo.springboot2mybatisforum.core.CommomMethod;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class MD5Util {

    public static Object getMD5Password(String password,String username){
        String hashAlgorithName = "MD5";
        String ps = password;
        int hashIterations = 1024;//加密次数
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
        Object obj = new SimpleHash(hashAlgorithName, password, credentialsSalt, hashIterations);
        return obj;
    }
}
