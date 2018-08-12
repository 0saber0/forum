package com.milanuo.springboot2mybatisforum.core.Shiro;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class Md5Util {

    public static void main(String[] args) {
        String hashAlgorithName = "MD5";
        String password = "lgy3121196";
        int hashIterations = 1024;//加密次数
        ByteSource credentialsSalt = ByteSource.Util.bytes("saber");
        Object obj = new SimpleHash(hashAlgorithName, password, credentialsSalt, hashIterations);
        System.out.println(obj);
    }
}
