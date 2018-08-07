package com.milanuo.springboot2mybatisforum.web.admin.topic;

import com.milanuo.springboot2mybatisforum.core.CommomMethod.TagsHandle;
import com.milanuo.springboot2mybatisforum.core.PageResult.BasePageResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.core.ajax.AjaxResult;
import com.milanuo.springboot2mybatisforum.module.reply.service.ReplyService;
import com.milanuo.springboot2mybatisforum.module.tags.service.TagsTopicsService;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.TopicAddU;
import com.milanuo.springboot2mybatisforum.module.topic.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/topic")
public class AdminTopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private TagsTopicsService tagsTopicsService;

    @Autowired
    private TagsHandle tagsHandle;


    @GetMapping("/list")
    public String list(Integer pageNo,Model model){
        Query4Topics query4Topics = new Query4Topics();
        if(pageNo!=null){
            query4Topics.setPageNum(pageNo);
        }else{
            query4Topics.setPageNum(1);
        }
        query4Topics.setPageSize(20);
        List<TopicAddU> topicList = topicService.getAllTopic(query4Topics);
        BasePageResult basePageResult = new BasePageResult();
        basePageResult.setPageNum(query4Topics.getPageNum());
        basePageResult.setPageSize(query4Topics.getPageSize());
        basePageResult.setTotalCount(topicService.getAllTopicCount(query4Topics));
        model.addAttribute("topicList",topicList);
        model.addAttribute("basePageResult",basePageResult);

        return "admin/topic/list";
    }

    @GetMapping("/top")
    @ResponseBody
    public AjaxResult top(Integer id){
        AjaxResult ajaxResult = new AjaxResult();
        Topic topic = new Topic();

        try{
            if(id!=null){
                topic.setId(id);
                topic.setTop((byte)1);
                topicService.update(topic);
                ajaxResult.setSuccessful(true);
                ajaxResult.setDescribe("置顶成功");
            }

        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccessful(false);
            ajaxResult.setDescribe("置顶失败，请重试");
        }

        return ajaxResult;
    }

    @GetMapping("/good")
    @ResponseBody
    public AjaxResult good(Integer id){
        AjaxResult ajaxResult = new AjaxResult();
        Topic topic = new Topic();

        try{
            if(id!=null){
                topic.setId(id);
                topic.setGood((byte)1);
                topicService.update(topic);
                ajaxResult.setSuccessful(true);
                ajaxResult.setDescribe("加精成功");
            }

        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccessful(false);
            ajaxResult.setDescribe("加精失败，请重试");
        }

        return ajaxResult;
    }

    @GetMapping("/delete")
    @ResponseBody
    public AjaxResult delete(Integer id){
        AjaxResult ajaxResult = new AjaxResult();

        try{
            if(id!=null){
                tagsTopicsService.deleteByTopicId(id);
                topicService.deleteByTopicId(id);
                replyService.deleteByTopicId(id);
                ajaxResult.setSuccessful(true);
                ajaxResult.setDescribe("删除成功");
            }

        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccessful(false);
            ajaxResult.setDescribe("删除失败，请重试");
        }

        return ajaxResult;
    }

    @GetMapping("/editPage")
    public String editPage(Integer id,Model model){

        Topic topic = topicService.getTopicById(id);
        model.addAttribute("topic",topic);

        return "admin/topic/edit";
    }

    @PostMapping("/editSave")
    @ResponseBody
    public AjaxResult editSave(Integer id, String title, String content, String tags) {
        AjaxResult ajaxResult = new AjaxResult();
        Topic topic = new Topic();

        try {
            topic.setId(id);
            topic.setContent(content);
            topic.setTitle(title);
            topic.setTags(tags);
            topicService.update(topic);
            tagsHandle.tagsHandle(id, tags);
            ajaxResult.setSuccessful(true);
            ajaxResult.setDescribe("修改成功");

        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.setDescribe("修改失败，请重试");
            ajaxResult.setSuccessful(false);
        }

        return ajaxResult;
    }
}
