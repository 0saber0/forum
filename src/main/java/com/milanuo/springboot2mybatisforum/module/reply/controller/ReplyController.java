package com.milanuo.springboot2mybatisforum.module.reply.controller;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageReplyResult;
import com.milanuo.springboot2mybatisforum.core.ajax.AjaxResult;
import com.milanuo.springboot2mybatisforum.module.reply.pojo.Reply;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @GetMapping("/getReplyCountByTopicId")
    @ResponseBody
    public Integer getReplyCountByTopicId(Integer topicId){
        return replyService.getReplyCountByTopicId(topicId);
    }

    @PostMapping("/save")
    @ResponseBody
    public AjaxResult save(Integer topicId, Integer userId, String comment, Model model){

        AjaxResult ajaxResult = new AjaxResult();
        Reply reply = new Reply();
        try{
            reply.setContent(comment);
            reply.setUserId(userId);
            reply.setTopicId(topicId);
            reply.setInTime(new Date());
            replyService.save(reply);
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("评论成功");
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccessful(false);
            ajaxResult.setDescribe("评论失败，请重试");
        }

        return ajaxResult;
    }

}
