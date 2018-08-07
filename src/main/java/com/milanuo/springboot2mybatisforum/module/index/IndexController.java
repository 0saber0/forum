package com.milanuo.springboot2mybatisforum.module.index;

import com.milanuo.springboot2mybatisforum.core.PageResult.BasePageResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.IndexPageResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Object;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;
import com.milanuo.springboot2mybatisforum.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;


    @RequestMapping("/index")
    public String index(Query4Object query4Object,Model model){

        List<IndexPageResult> indexList = new ArrayList<>();

        BasePageResult basePageResult = new BasePageResult();
        Integer totalCount = topicService.queryForCount(query4Object);
        basePageResult.setPageNum(query4Object.getPageNum());
        basePageResult.setPageSize(query4Object.getPageSize());
        basePageResult.setTotalCount(totalCount);
        model.addAttribute("basePageResult",basePageResult);
        model.addAttribute("query4object",query4Object);

        List<Topic> list = topicService.query(query4Object);

        for (Topic topic:list){
            IndexPageResult indexPageResult = new IndexPageResult();
            User user = userService.getOne(topic.getUserId());
            Integer replyCount = replyService.getReplyCountByTopicId(topic.getId());
            indexPageResult.setTopic(topic);
            indexPageResult.setUser(user);
            indexPageResult.setReplyCount(replyCount);
            indexList.add(indexPageResult);
        }

        model.addAttribute("indexList",indexList);

        return "front/index";
    }
}
