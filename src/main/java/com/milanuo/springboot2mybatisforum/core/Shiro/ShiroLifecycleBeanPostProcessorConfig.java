package com.milanuo.springboot2mybatisforum.core.Shiro;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ShiroLifecycleBeanPostProcessorConfig {

    /**
     * lifecycleBeanPostProcessor是负责生命周期的 , 初始化和销毁的类
     * (可选)
     */
    @Bean
    public org.apache.shiro.spring.LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new org.apache.shiro.spring.LifecycleBeanPostProcessor();
    }
}
