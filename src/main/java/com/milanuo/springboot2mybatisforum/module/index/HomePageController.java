package com.milanuo.springboot2mybatisforum.module.index;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageReplyResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageTopicResult;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import com.milanuo.springboot2mybatisforum.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/homepage")
public class HomePageController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @GetMapping("{id}")
    public String homepage(@PathVariable Integer id,Model model){

        User homepage_user = userService.getOne(id);
        List<HomePageTopicResult> homepage_topic_list = topicService.getHomePageTopicsByUserId(id);
        List<HomePageReplyResult> homepage_reply = replyService.getHomePageReplyResult(id);
        model.addAttribute("homepage_user",homepage_user);
        model.addAttribute("homepage_topic_list",homepage_topic_list);
        model.addAttribute("homepage_reply",homepage_reply);

        return "homepage";
    }
}
