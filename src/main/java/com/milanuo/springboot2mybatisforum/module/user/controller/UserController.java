package com.milanuo.springboot2mybatisforum.module.user.controller;

import com.milanuo.springboot2mybatisforum.core.MyProps.MyProps;
import com.milanuo.springboot2mybatisforum.core.PageResult.BasePageResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageReplyResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageTopicResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Object;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.core.ajax.AjaxResult;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import com.milanuo.springboot2mybatisforum.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private MyProps myProps;

    @PostMapping("/add")
    public void add(User user) {
        userService.add(user);
    }

    @GetMapping("/getOne")
    @ResponseBody
    public User getOne(Integer id) {
        return userService.getOne(id);
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult login(String username, String password, String code, HttpServletRequest request) {
        AjaxResult result = new AjaxResult();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        String indexCode = (String) request.getSession().getAttribute("index_code");

        try {
            if (indexCode.equalsIgnoreCase(code)) {
                User user1 = userService.doLogin(user);
                if (user1 != null) {
                    request.getSession().setAttribute("user0", user1);
                    result.setSuccessful(true);
                    result.setDescribe("登录成功");
                } else {
                    result.setSuccessful(false);
                    result.setDescribe("用户名或密码错误，请检查后重新登录");
                }
            } else {
                result.setDescribe("验证码错误，请重新输入");
                result.setSuccessful(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccessful(false);
            result.setDescribe("登录失败，请重新登录");
        }

        return result;
    }

    @RequestMapping("/register")
    @ResponseBody
    public AjaxResult register(String username, String password, String email, String code, HttpServletRequest request) {
        AjaxResult result = new AjaxResult();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setImage("1.jpg");
        user.setInTime(new Date());
        String indexCode = (String) request.getSession().getAttribute("index_code");

        try {
            if (indexCode.equalsIgnoreCase(code)) {
                userService.add(user);
                result.setDescribe("恭喜你，注册成功");
                result.setSuccessful(true);
            } else {
                result.setDescribe("验证码错误，请重新输入");
                result.setSuccessful(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccessful(false);
            result.setDescribe("注册失败，请重新操作");
        }

        return result;
    }

    @RequestMapping("/setting")
    public String setting(){

        return "setting";
    }

    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(Integer id,String email,String intro , HttpSession session){

        AjaxResult result = new AjaxResult();
        User user = new User();
        user.setId(id);
        user.setEmail(email);
        user.setIntro(intro);
        try{
            userService.update(user);
            result.setSuccessful(true);
            User user1 = (User)session.getAttribute("user0");
            user1.setEmail(email);
            user1.setIntro(intro);
            session.setAttribute("user0",user1);
            result.setDescribe("修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccessful(false);
            result.setDescribe("修改失败，请重试");
        }
        return result;
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public AjaxResult updatePassword(Integer id,String oldPassword,String newPassword, HttpSession session){

        AjaxResult result = new AjaxResult();
        User user1 = (User)session.getAttribute("user0");
        if(oldPassword.equals(user1.getPassword())){
            User user = new User();
            user.setId(id);
            user.setPassword(newPassword);
            try{
                userService.update(user);
                result.setSuccessful(true);
                user1.setPassword(newPassword);
                session.setAttribute("user0",user1);
                result.setDescribe("修改成功");
            }catch (Exception e){
                e.printStackTrace();
                result.setSuccessful(false);
                result.setDescribe("修改失败，请重试");
            }
        }else{
            result.setSuccessful(false);
            result.setDescribe("原密码错误，请重试");
        }

        return result;
    }

    @GetMapping("{username}/topics")
    public String userTopics(@PathVariable String username,Integer pageNum,Model model){
        User topics_user = userService.getUserByUserName(username);
        Query4Topics query4Topics = new Query4Topics();
        query4Topics.setId(topics_user.getId());
        query4Topics.setPageNum(pageNum);
        List<HomePageTopicResult> user_topics_list = topicService.getUserTopicsByUserId(query4Topics);
        BasePageResult basePageResult = new BasePageResult();
        basePageResult.setPageNum(pageNum);
        basePageResult.setPageSize(20);
        basePageResult.setTotalCount(topicService.getUserTopicsCount(query4Topics));
        model.addAttribute("topics_user",topics_user);
        model.addAttribute("user_topics_list",user_topics_list);
        model.addAttribute("basePageResult",basePageResult);
        return "userTopics";
    }

    @GetMapping("{username}/replys")
    public String userReplys(@PathVariable String username,Integer pageNum,Model model){

        User replys_user = userService.getUserByUserName(username);
        Query4Topics query4Topics = new Query4Topics();
        query4Topics.setId(replys_user.getId());
        query4Topics.setPageNum(pageNum);
        List<HomePageReplyResult> user_replys_list = replyService.getUserReplysByUserId(query4Topics);
        BasePageResult basePageResult = new BasePageResult();
        basePageResult.setPageNum(pageNum);
        basePageResult.setPageSize(20);
        basePageResult.setTotalCount(replyService.getUserReplysCount(query4Topics));
        model.addAttribute("replys_user",replys_user);
        model.addAttribute("user_replys_list",user_replys_list);
        model.addAttribute("basePageResult",basePageResult);
        return "userReplys";
    }

    @PostMapping("/image")
    public String image(@RequestParam(value="file",required=false) MultipartFile file,
                              HttpServletRequest request,Model model)throws Exception{
        //基本表单

        //获得物理路径webapp所在路径
        String photoPath="";
        String path = "";
        if(!file.isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","").substring(0,19);
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=file.getContentType();
            //获得文件后缀名称
            String imageName=contentType.substring(contentType.indexOf("/")+1);
            //地址
            path=myProps.getPhotoPath()+uuid+"."+imageName;
            file.transferTo(new File(path));
            photoPath = uuid+"."+imageName;
        }
        User user = new User();
        user.setId(((User)(request.getSession().getAttribute("user0"))).getId());
        user.setImage(photoPath);
        userService.update(user);

        return "redirect:/homepage/"+((User)(request.getSession().getAttribute("user0"))).getId();
    }

}
