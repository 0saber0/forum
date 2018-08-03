package com.milanuo.springboot2mybatisforum;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.milanuo.springboot2mybatisforum.module")
public class Springboot2MybatisForumApplication {

	public static void main(String[] args) {
		SpringApplication.run(Springboot2MybatisForumApplication.class, args);
	}
}
