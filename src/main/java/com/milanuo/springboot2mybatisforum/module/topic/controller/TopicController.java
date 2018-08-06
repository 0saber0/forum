package com.milanuo.springboot2mybatisforum.module.topic.controller;

import com.milanuo.springboot2mybatisforum.core.CommomMethod.TagsHandle;
import com.milanuo.springboot2mybatisforum.core.PageResult.ReplyResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.TopicDetailPageResult;
import com.milanuo.springboot2mybatisforum.core.ajax.AjaxResult;
import com.milanuo.springboot2mybatisforum.module.reply.pojo.Reply;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsTopics;
import com.milanuo.springboot2mybatisforum.module.tags.service.TagsTopicsService;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import com.milanuo.springboot2mybatisforum.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private TagsHandle tagsHandle;

    @Autowired
    private TagsTopicsService tagsTopicsService;

    @GetMapping("{id}")
    public String detail(@PathVariable Integer id, Model model) {

        TopicDetailPageResult topicDetailPageResult = new TopicDetailPageResult();
        Topic topic = topicService.getTopicById(id);
        User user = userService.getOne(topic.getUserId());
        List<ReplyResult> replys = new ArrayList<>();
        for (Reply reply : replyService.getReplyByTopicId(id)) {
            ReplyResult replyResult = new ReplyResult();
            User replyUser = userService.getOne(reply.getUserId());
            replyResult.setReply(reply);
            replyResult.setUser(replyUser);
            replys.add(replyResult);
        }
        topicDetailPageResult.setTopic(topic);
        topicDetailPageResult.setUser(user);
        topicDetailPageResult.setReplys(replys);
        topicDetailPageResult.setReplyCount(replyService.getReplyCountByTopicId(id));
        model.addAttribute("topicDetailPageResult", topicDetailPageResult);

        //将该篇topic的view加1
        Topic topic1 = new Topic();
        topic1.setView(topic.getView() + 1);
        topic1.setId(id);
        topicService.update(topic1);

        return "topic";
    }

    @RequestMapping("/create")
    public String create(){

        return "createTopic";
    }

    @PostMapping("/save")
    @ResponseBody
    public AjaxResult save(String title, String content, String tags, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        Topic topic = new Topic();

        try {
            topic.setContent(content);
            topic.setInTime(new Date());
            topic.setTitle(title);
            topic.setTags(tags);
            topic.setUserId(((User) session.getAttribute("user0")).getId());
            topic.setView(0);
            topicService.save(topic);
            tagsHandle.tagsHandle(topic.getId(), tags);
            ajaxResult.setDatas(topic.getId());
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("保存成功");

        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("保存失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

    @GetMapping("/edit")
    public String edit(Integer id, Model model) {

        Topic topic = topicService.getTopicById(id);
        model.addAttribute("topic", topic);
        return "editTopic";
    }

    @PostMapping("/editSave")
    @ResponseBody
    public AjaxResult editSave(Integer id, String title, String content, String tags, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        Topic topic = new Topic();

        try {
            topic.setId(id);
            topic.setContent(content);
            topic.setTitle(title);
            topic.setTags(tags);
            topicService.update(topic);
            tagsHandle.tagsHandle(topic.getId(), tags);
            ajaxResult.setDatas(topic.getId());
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("保存成功");

        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("修改失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }

    @GetMapping("/delete")
    public String delete(Integer id, Integer userId) {

        tagsTopicsService.deleteByTopicId(id);
        topicService.deleteByTopicId(id);
        replyService.deleteByTopicId(id);

        return "forward:/homepage/" + userId;
    }
}
