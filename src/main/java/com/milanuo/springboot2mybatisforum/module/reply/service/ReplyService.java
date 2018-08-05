package com.milanuo.springboot2mybatisforum.module.reply.service;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageReplyResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.reply.dao.ReplyMapper;
import com.milanuo.springboot2mybatisforum.module.reply.pojo.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    public Integer getReplyCountByTopicId(Integer topicId){
        return replyMapper.getReplyCountByTopicId(topicId);
    }

    public List<Reply> getReplyByTopicId(Integer id) {
        return replyMapper.getReplyByTopicId(id);
    }

    public void save(Reply reply) {
        replyMapper.insertSelective(reply);
    }

    public List<HomePageReplyResult> getHomePageReplyResult(Integer id){
        return replyMapper.getHomePageReplyResult(id);
    }

    public List<HomePageReplyResult> getUserReplysByUserId(Query4Topics query4Topics) {
        return replyMapper.getUserReplysByUserId(query4Topics);
    }

    public Integer getUserReplysCount(Query4Topics query4Topics) {
        return replyMapper.getUserReplysCount(query4Topics);
    }

    public void deleteByTopicId(Integer id) {
        replyMapper.deleteByTopicId(id);
    }
}
