package com.milanuo.springboot2mybatisforum.module.topic.dao;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageTopicResult;
import com.milanuo.springboot2mybatisforum.core.PageResult.TagsTopicsPageResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Object;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;

import java.util.List;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKeyWithBLOBs(Topic record);

    int updateByPrimaryKey(Topic record);

    List<Topic> query(Query4Object query4Object);

    Integer queryForCount(Query4Object query4Object);

    List<Topic> getTopicsByUserId(Integer id);

    List<HomePageTopicResult> getHomePageTopicsByUserId(Integer id);

    List<HomePageTopicResult> getUserTopicsByUserId(Query4Topics query4Topics);

    Integer getUserTopicsCount(Query4Topics query4Topics);

    List<Topic> getIdTiItByUserId(Query4Topics query4Topics);

    Integer getIdTiItCountByUserId(Query4Topics query4Topics);

    String getTags();

    List<TagsTopicsPageResult> getTopicsByTag(Query4Topics query4Topics);
}