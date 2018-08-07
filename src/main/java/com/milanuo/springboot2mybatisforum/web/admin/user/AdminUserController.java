package com.milanuo.springboot2mybatisforum.web.admin.user;

import com.milanuo.springboot2mybatisforum.core.PageResult.BasePageResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.core.ajax.AjaxResult;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsTopics;
import com.milanuo.springboot2mybatisforum.module.tags.service.TagsTopicsService;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import com.milanuo.springboot2mybatisforum.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private TopicService topicService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private TagsTopicsService tagsTopicsService;

    @GetMapping("/list")
    public String list(Integer pageNo,Model model){

        Query4Topics query4Topics = new Query4Topics();
        if(pageNo!=null){
            query4Topics.setPageNum(pageNo);
        }else{
            query4Topics.setPageNum(1);
        }
        query4Topics.setPageSize(20);

        List<User> userList = userService.getAllUser(query4Topics);

        BasePageResult basePageResult = new BasePageResult();
        basePageResult.setPageNum(query4Topics.getPageNum());
        basePageResult.setPageSize(query4Topics.getPageSize());
        basePageResult.setTotalCount(userService.getAllUserCount(query4Topics));

        model.addAttribute("userList",userList);
        model.addAttribute("basePageResult",basePageResult);

        return "admin/user/list";
    }

    @GetMapping("/block")
    @ResponseBody
    public AjaxResult block(Integer id){

        AjaxResult ajaxResult = new AjaxResult();
        User user = new User();

        try {
            user.setId(id);
            user.setState("disable");
            userService.update(user);
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("锁定成功");
        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("锁定失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

    @GetMapping("/usering")
    @ResponseBody
    public AjaxResult usering(Integer id){

        AjaxResult ajaxResult = new AjaxResult();
        User user = new User();

        try {
            user.setId(id);
            user.setState("normal");
            userService.update(user);
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("启用成功");
        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("启用失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

    @GetMapping("/delete")
    @ResponseBody
    public AjaxResult delete(Integer id){

        AjaxResult ajaxResult = new AjaxResult();

        try {
            //删除user
            userService.delete(id);
            //删除user相关的topic
            List<Integer> idList = topicService.getAllTopicIdByUserId(id);
            for(Integer topicId:idList){

                tagsTopicsService.deleteByTopicId(topicId);
                topicService.deleteByTopicId(topicId);
            }
            //删除topic相关的标签联合表
            //删除user相关的评论
            replyService.deleteByUserId(id);

            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("启用成功");
        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("启用失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

    @GetMapping("/editPage")
    public String editPage(Integer id,Model model){
        User user = userService.getOne(id);
        model.addAttribute("user",user);

        return "admin/user/edit";
    }

    @PostMapping("/editSave")
    @ResponseBody
    public AjaxResult editSave(Integer id,String username ,String password){

        AjaxResult ajaxResult = new AjaxResult();
        User user = new User();

        try {
            user.setId(id);
            user.setUsername(username);
            if(password!=null&&!"".equals(password.trim())){
                user.setPassword(password);
            }
            userService.update(user);
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("启用成功");
        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("启用失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

}
