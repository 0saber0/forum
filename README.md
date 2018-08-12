## 技术栈

- JDK8
- Spring-Boot
- MyBatis
- Spring-Shiro
- Freemarker
- MySQL
- Bootstrap3

## 特性

- 社区兼容性（IE9+）
- 页面自适应布局
- 本地登录，注册
- 登录时有验证码
- 使用 `Spring-Boot` 开发
- 使用MyBatis操作数据库
- 目前sql语句只支持MySQL，如果要切换数据库，需要手动修改代码 

#### 写在前面

开发环境要在IDE里装上lombok插件，否则编译器会报错

- 创建数据库forum, 字符集utf8，如果想支持emoji，就要选择utf8mb4字符集（仅限使用MySQL数据库）
- `git clone https://github.com/0saber0/forum`
- 将项目下的 `init.sql` 文件导入到数据库
- 运行 `mvn spring-boot:run` 启动项目
- 前台页面访问 `http://localhost:8080/index`
- 后台页面访问 `http://localhost:8080/admin/login` 用户名: admin 密码: admin
