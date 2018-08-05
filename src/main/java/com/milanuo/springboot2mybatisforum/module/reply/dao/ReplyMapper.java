package com.milanuo.springboot2mybatisforum.module.reply.dao;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageReplyResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.reply.pojo.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);

    Integer getReplyCountByTopicId(Integer topicId);

    List<Reply> getReplyByTopicId(Integer id);

    List<HomePageReplyResult> getHomePageReplyResult(Integer userId);

    List<HomePageReplyResult> getUserReplysByUserId(Query4Topics query4Topics);

    Integer getUserReplysCount(Query4Topics query4Topics);

    void deleteByTopicId(Integer id);
}