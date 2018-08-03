package com.milanuo.springboot2mybatisforum.module.topic.service;

import com.milanuo.springboot2mybatisforum.core.PageResult.HomePageTopicResult;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Object;
import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.topic.dao.TopicMapper;
import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TopicService {

    @Autowired
    private TopicMapper topicMapper;

    public Topic getTopicById(Integer id){

        return topicMapper.selectByPrimaryKey(id);
    }

    public List<Topic> query(Query4Object query4Object){
        return topicMapper.query(query4Object);
    }

    public Integer queryForCount(Query4Object query4Object) {
        return topicMapper.queryForCount(query4Object);
    }

    public void update(Topic topic1) {
        topicMapper.updateByPrimaryKeySelective(topic1);
    }

    public List<Topic> getTopicsByUserId(Integer id) {
        return topicMapper.getTopicsByUserId(id);
    }

    public List<HomePageTopicResult> getHomePageTopicsByUserId(Integer id){
        return topicMapper.getHomePageTopicsByUserId(id);
    }

    public List<HomePageTopicResult> getUserTopicsByUserId(Query4Topics query4Topics) {
        return topicMapper.getUserTopicsByUserId(query4Topics);
    }

    public Integer getUserTopicsCount(Query4Topics query4Topics) {
        return topicMapper.getUserTopicsCount(query4Topics);
    }

    public void save(Topic topic) {
        topicMapper.insertSelective(topic);
    }

    public List<Topic> getIdTiItByUserId(Query4Topics query4Topics){
        return topicMapper.getIdTiItByUserId(query4Topics);
    }

    public Integer getIdTiItCountByUserId(Query4Topics query4Topics){
        return topicMapper.getIdTiItCountByUserId(query4Topics);
    }
}
